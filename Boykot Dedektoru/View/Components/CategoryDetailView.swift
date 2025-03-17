import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    @Environment(\.dismiss) private var dismiss
    @State private var selectedFilter = "Hepsi"
    let filters = ["Hepsi", "Boykotlu", "Uygun"]
    
    var filteredBrands: [Brand] {
        switch selectedFilter {
        case "Boykotlu":
            return category.brands.filter { $0.status == "BOYKOTLU" }
        case "Uygun":
            return category.brands.filter { $0.status == "UYGUN" }
        default:
            return category.brands
        }
    }
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 0.1, green: 0.2, blue: 0.4),
                Color(red: 0.05, green: 0.1, blue: 0.2)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // Header
                VStack(spacing: 4) {
                    Text(category.name)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("\(category.brands.count) Marka")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 16)
                
                // Filter Buttons
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
                }
                .padding(.horizontal)
                
                // Brands list
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(filteredBrands) { brand in
                            BrandCard(brand: brand)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
    }
} 