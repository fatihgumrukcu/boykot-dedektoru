import SwiftUI

struct BrandDetailView: View {
    let brand: Brand
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                // Üst kısım - Logo
                Image(brand.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
                    .padding(10)
                    .background(Color(red: 0.05, green: 0.1, blue: 0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                
                // Alt kısım - Detaylar
                VStack(alignment: .leading, spacing: 24) {
                    // Marka adı ve durumu
                    HStack(alignment: .center) {
                        Text(brand.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(brand.status)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(brand.status == "BOYKOTLU" ? .red : .green)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(brand.status == "BOYKOTLU" ? Color.red.opacity(0.15) : Color.green.opacity(0.15))
                            .clipShape(Capsule())
                    }
                    .padding(.top, 8)
                    
                    // Kategori ve Açıklama Grubu
                    VStack(alignment: .leading, spacing: 12) {
                        Text(brand.description)
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Text(brand.detailDescription)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                            .lineSpacing(6)
                    }
                    .padding(.vertical, 4)
                    
                    // Alternatifler
                    if !brand.alternatives.isEmpty {
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Alternatif Markalar")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(brand.alternatives, id: \.self) { alternative in
                                    HStack(spacing: 12) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .font(.system(size: 18))
                                        
                                        Text(alternative)
                                            .font(.body)
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                            .padding(.horizontal, 4)
                        }
                        .padding(.bottom, 20)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.2, blue: 0.4),
                    Color(red: 0.05, green: 0.1, blue: 0.2)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    BrandDetailView(brand: BrandData.brands[0])
        .preferredColorScheme(.dark)
} 
