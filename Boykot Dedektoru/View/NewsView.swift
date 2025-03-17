import SwiftUI

struct NewsItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let fullContent: String
    let date: String
    let imageSystemName: String
}

struct NewsView: View {
    let news = [
        NewsItem(
            title: "Boykot Nedir?",
            description: "Boykot, bir ürün, hizmet veya organizasyona karşı toplumsal tepki olarak kullanılan barışçıl bir protesto yöntemidir. Tüketicilerin bilinçli tercihleriyle değişim yaratma gücü...",
            fullContent: """
            Boykot, bir ürün, hizmet veya organizasyona karşı toplumsal tepki olarak kullanılan barışçıl bir protesto yöntemidir. 
            
            Boykotun Özellikleri:
            • Barışçıl bir direniş yöntemidir
            • Ekonomik ve sosyal etki yaratır
            • Toplumsal farkındalık oluşturur
            • Değişim için güçlü bir araçtır
            
            Boykot, tüketicilerin satın alma güçlerini kullanarak şirketleri ve kurumları daha etik davranmaya teşvik etmelerini sağlar. Bu yöntem, tarih boyunca sosyal değişimin önemli araçlarından biri olmuştur.
            """,
            date: "14 Mart 2024",
            imageSystemName: "info.circle.fill"
        ),
        NewsItem(
            title: "Tarihteki Önemli Boykotlar",
            description: "Tarih boyunca birçok başarılı boykot hareketi toplumsal değişimlere öncülük etmiştir. Montgomery Otobüs Boykotu, Salt Yürüyüşü gibi örnekler...",
            fullContent: """
            Tarih boyunca gerçekleşen önemli boykot hareketleri ve etkileri:

            1. Montgomery Otobüs Boykotu (1955-1956)
            • Rosa Parks'ın tutuklanmasıyla başladı
            • 381 gün sürdü
            • Toplu taşımada ırk ayrımcılığının kaldırılmasını sağladı

            2. Hindistan Tuz Yürüyüşü (1930)
            • Mahatma Gandhi önderliğinde gerçekleşti
            • Britanya'nın tuz tekeline karşı yapıldı
            • Hindistan bağımsızlık hareketinin önemli dönüm noktası oldu

            3. Güney Afrika Apartheid Boykotları (1960-1990)
            • Uluslararası spor ve kültür boykotları
            • Ekonomik yaptırımlar
            • Apartheid rejiminin sonlanmasında etkili oldu
            """,
            date: "13 Mart 2024",
            imageSystemName: "book.fill"
        ),
        NewsItem(
            title: "Neden Boykot Önemlidir?",
            description: "Boykotlar, tüketicilerin seslerini duyurabilecekleri en etkili yöntemlerden biridir. Etik olmayan uygulamalara karşı toplumsal bir duruş...",
            fullContent: """
            Boykotun Önemi ve Etkileri:

            1. Ekonomik Etki
            • Şirketleri politikalarını değiştirmeye zorlar
            • Finansal baskı oluşturur
            • Pazar dinamiklerini etkiler

            2. Sosyal Farkındalık
            • Toplumsal bilinç oluşturur
            • Medya ilgisi çeker
            • Kamuoyu oluşumuna katkı sağlar

            3. Değişim Aracı
            • Barışçıl protesto imkanı sunar
            • Demokratik katılımı teşvik eder
            • Sürdürülebilir değişim sağlar

            4. Tüketici Hakları
            • Tüketici gücünü gösterir
            • Şeffaflığı artırır
            • Etik ticaret pratiklerini destekler
            """,
            date: "12 Mart 2024",
            imageSystemName: "lightbulb.fill"
        )
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.2, blue: 0.4),
                    Color(red: 0.05, green: 0.1, blue: 0.2)
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(news) { item in
                            NewsCard(item: item)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Boykot Rehberi")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct NewsCard: View {
    let item: NewsItem
    @State private var showingDetail = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Image(systemName: item.imageSystemName)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.date)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .padding(.horizontal)
            
            // Content
            Text(item.description)
                .font(.body)
                .padding(.horizontal)
                .lineSpacing(4)
                .lineLimit(3)
            
            // Footer
            HStack {
                Spacer()
                Button(action: {
                    showingDetail = true
                }) {
                    Text("Devamını Oku")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            .padding(.top, 4)
        }
        .padding(.vertical, 8)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal)
        .foregroundColor(.white)
        .sheet(isPresented: $showingDetail) {
            DetailView(item: item)
        }
    }
}

struct DetailView: View {
    let item: NewsItem
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 0.1, green: 0.2, blue: 0.4),
                Color(red: 0.05, green: 0.1, blue: 0.2)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Header
                    HStack {
                        Image(systemName: item.imageSystemName)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color(red: 0.2, green: 0.4, blue: 0.8))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text(item.date)
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    
                    // Full Content
                    Text(item.fullContent)
                        .font(.body)
                        .lineSpacing(6)
                        .padding()
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewsView()
} 