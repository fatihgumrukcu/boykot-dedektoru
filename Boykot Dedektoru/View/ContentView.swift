//
//  ContentView.swift
//  Boykot Dedektoru
//
//  Created by Fatih Gümrükçü on 14.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var searchText = ""
    @State private var selectedFilter = "Hepsi"
    @State private var isGridView = false
    @State private var isShowingSplash = true // SplashScreen için state
    let filters = ["Hepsi", "Boykotlu", "Uygun"]
    
    var filteredBrands: [Brand] {
        let searchFiltered = searchText.isEmpty ? BrandData.brands : BrandData.brands.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        
        switch selectedFilter {
        case "Boykotlu":
            return searchFiltered.filter { $0.status == "BOYKOTLU" }
        case "Uygun":
            return searchFiltered.filter { $0.status == "UYGUN" }
        default:
            return searchFiltered
        }
    }
    
    var body: some View {
        ZStack {
            if isShowingSplash {
                SplashScreen()
                    .onAppear {
                        // 2 saniye sonra SplashScreen'i kaldır
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                isShowingSplash = false
                            }
                        }
                    }
            } else {
                ZStack(alignment: .bottom) {
                    TabView(selection: $selectedTab) {
                        // Ana Sayfa
                        NavigationView {
                            ZStack {
                                // Background gradient
                                LinearGradient(gradient: Gradient(colors: [
                                    Color(red: 0.1, green: 0.2, blue: 0.4),
                                    Color(red: 0.05, green: 0.1, blue: 0.2)
                                ]), startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
                                
                                VStack(spacing: 16) {
                                    // Title
                                    Text("Boykot Dedektörü")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.top, 16)
                                    
                                    // Search bar
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.white.opacity(0.7))
                                        
                                        TextField("Marka Ara", text: $searchText)
                                            .textFieldStyle(PlainTextFieldStyle())
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    
                                    // Filter Buttons and View Toggle
                                    HStack {
                                        ForEach(filters, id: \.self) { filter in
                                            Button(action: {
                                                selectedFilter = filter
                                            }) {
                                                Text(filter)
                                                    .font(.system(size: 16))
                                                    .foregroundColor(selectedFilter == filter ? .white : .white.opacity(0.7))
                                                    .frame(maxWidth: .infinity)
                                                    .padding(.vertical, 8)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .fill(selectedFilter == filter ? 
                                                                Color(red: 0.2, green: 0.4, blue: 0.8) : 
                                                                Color.white.opacity(0.1))
                                                    )
                                            }
                                        }
                                        
                                        Button(action: {
                                            withAnimation {
                                                isGridView.toggle()
                                            }
                                        }) {
                                            Image(systemName: isGridView ? "list.bullet" : "square.grid.2x2")
                                                .font(.system(size: 16))
                                                .foregroundColor(.white)
                                                .frame(width: 40, height: 40)
                                                .background(
                                                    Circle()
                                                        .fill(Color.white.opacity(0.1))
                                                )
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    // Brands list/grid
                                    ScrollView {
                                        if isGridView {
                                            LazyVGrid(columns: [
                                                GridItem(.flexible()),
                                                GridItem(.flexible())
                                            ], spacing: 12) {
                                                ForEach(filteredBrands) { brand in
                                                    BrandGridCard(brand: brand)
                                                }
                                            }
                                            .padding(.horizontal)
                                        } else {
                                            LazyVStack(spacing: 12) {
                                                ForEach(filteredBrands) { brand in
                                                    BrandCard(brand: brand)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                    }
                                    // Bottom padding kaldırıldı
                                }
                            }
                            .navigationBarHidden(true)
                        }
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Ana Sayfa")
                        }
                        .tag(0)
                        
                        // Kategoriler
                        CategoriesView()
                            .tabItem {
                                Image(systemName: "square.grid.2x2.fill")
                                Text("Kategoriler")
                            }
                            .tag(1)
                        
                        // Boş sekme (ortadaki barkod tarayıcı için)
                        Color.clear
                            .tabItem { Text("") }
                            .tag(2)
                        
                        // Haberler
                        NewsView()
                            .tabItem {
                                Image(systemName: "newspaper.fill")
                                Text("Haberler")
                            }
                            .tag(3)
                        
                        // Ayarlar
                        SettingsView()
                            .tabItem {
                                Image(systemName: "gearshape.fill")
                                Text("Ayarlar")
                            }
                            .tag(4)
                    }
                    .accentColor(.white)
                    
                    // Ortadaki çıkıntılı barkod tarama butonu
                    Button(action: {
                        selectedTab = 2 // Barkod tarayıcıyı aç
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(red: 0.2, green: 0.4, blue: 0.8))
                                .frame(width: 56, height: 56)
                                .shadow(radius: 4)
                            
                            Image(systemName: "barcode.viewfinder")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    .offset(y: -10)
                }
                .sheet(isPresented: .init(get: {
                    selectedTab == 2
                }, set: { newValue in
                    if !newValue {
                        selectedTab = 0
                    }
                })) {
                    CameraView { barcodeString in
                        print("Taranan barkod: \(barcodeString)")
                        selectedTab = 0
                    }
                }
                .onAppear {
                    let appearance = UITabBarAppearance()
                    appearance.configureWithOpaqueBackground()
                    appearance.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.4, alpha: 1.0)
                    
                    UITabBar.appearance().standardAppearance = appearance
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
