import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 0.1, green: 0.2, blue: 0.4),
                Color(red: 0.05, green: 0.1, blue: 0.2)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    // Logo ve Başlık
                    VStack(spacing: 16) {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                        
                        Text("Hakkımızda")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 32)
                    
                    // İçerik
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Boykot Dedektörü, bilinçli tüketicilerin etik alışveriş yapabilmesi için doğdu. Her gün raflardan seçtiğimiz ürünlerin arkasında hangi şirketlerin olduğu, bu şirketlerin kimleri desteklediği ve hangi etik değerlere sahip olduğu konusunda farkındalık yaratmak istiyoruz.")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 8)
                        
                        Text("Bu platform, insanların adil, çevre dostu ve insan haklarına saygılı markaları tercih etmelerine yardımcı olmak için geliştirildi. Günümüzde birçok marka, farkında olmadan desteklediğimiz politikalar, insan hakları ihlalleri ve çevresel zararlarla bağlantılı olabilir. Boykot Dedektörü, tüketicilere bilinç kazandırarak seçimlerini daha güçlü hale getirmeyi amaçlıyor.")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 8)
                        
                        Text("Artık tek bir dokunuşla boykot edilen markaları tespit edebilir, bilinçli seçimler yapabilir ve sürdürülebilir bir dünya için harekete geçebilirsin!")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 32)
            }
        }
    }
}

#Preview {
    AboutView()
} 