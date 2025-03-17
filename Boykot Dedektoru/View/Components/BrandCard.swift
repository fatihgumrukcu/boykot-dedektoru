import SwiftUI

struct BrandCard: View {
    let brand: Brand
    @State private var showDetail = false
    
    var statusColor: Color {
        brand.status == "BOYKOTLU" ? Color.red : Color.green
    }
    
    var categoryText: String {
        let firstSentence = brand.description.components(separatedBy: ".").first ?? ""
        return firstSentence.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        Button(action: {
            showDetail = true
        }) {
            ZStack {
                HStack(spacing: 0) {
                    // Marka Resmi
                    Image(brand.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .padding(.leading, -70)
                        .padding(.trailing, -40)
                    
                    // Marka Bilgileri
                    VStack(alignment: .leading, spacing: 6) {
                        Text(brand.name)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text(categoryText)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                    
                    // Durum renk göstergesi
                    Rectangle()
                        .fill(statusColor)
                        .frame(width: 8)
                }
                .frame(height: 110)
                .background(Color(red: 0.15, green: 0.2, blue: 0.3))
                .cornerRadius(12)
                .clipped()
            }
        }
        .sheet(isPresented: $showDetail) {
            BrandDetailView(brand: brand)
        }
    }
}

// Grid görünümü için yeni bir kart tasarımı
struct BrandGridCard: View {
    let brand: Brand
    @State private var showDetail = false
    
    var statusColor: Color {
        brand.status == "BOYKOTLU" ? Color.red : Color.green
    }
    
    var body: some View {
        Button(action: {
            showDetail = true
        }) {
            VStack(spacing: 12) {
                // Marka Resmi
                Image(brand.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                // Marka Bilgileri
                VStack(spacing: 4) {
                    Text(brand.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text(brand.description)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }
                .padding(.horizontal, 8)
                
                // Durum göstergesi
                Rectangle()
                    .fill(statusColor)
                    .frame(height: 4)
                    .cornerRadius(2)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color(red: 0.15, green: 0.2, blue: 0.3))
            .cornerRadius(12)
        }
        .sheet(isPresented: $showDetail) {
            BrandDetailView(brand: brand)
        }
    }
}

#Preview {
    VStack {
        BrandCard(brand: BrandData.brands[0])
        BrandGridCard(brand: BrandData.brands[0])
    }
    .padding()
    .background(Color.black)
} 