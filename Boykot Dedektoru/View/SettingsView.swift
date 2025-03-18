import SwiftUI
import UserNotifications

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                configuration.label
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(configuration.isOn ? Color(red: 0.2, green: 0.4, blue: 0.8) : Color.gray.opacity(0.3))
                    .frame(width: 50, height: 31)
                    .overlay(
                        Circle()
                            .fill(.white)
                            .padding(2)
                            .offset(x: configuration.isOn ? 10 : -10)
                    )
                    .animation(.spring(response: 0.2, dampingFraction: 0.9), value: configuration.isOn)
            }
        }
        .buttonStyle(.plain)
    }
}

struct SettingsView: View {
    @Environment(\.openURL) var openURL
    @StateObject private var notificationManager = NotificationManager.shared
    @AppStorage("notificationsEnabled") private var notificationsEnabled = false
    @State private var showAbout = false
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                notificationsEnabled = true
            }
        }
    }
    
    // Helper functions moved outside of body
    private func sectionHeader(text: String) -> some View {
        Text(text)
            .font(.system(size: 13, weight: .semibold))
            .foregroundColor(.white.opacity(0.7))
            .padding(.leading, 4)
    }
    
    private func menuButton(icon: String, text: String, action: (() -> Void)? = nil) -> some View {
        Button(action: {
            if let action = action {
                action()
            }
        }) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 30)
                
                Text(text)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 0.15, green: 0.25, blue: 0.45).opacity(0.5))
            )
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient - matching main theme
                LinearGradient(gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.2, blue: 0.4),
                    Color(red: 0.05, green: 0.1, blue: 0.2)
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                // Menu items
                VStack(spacing: 20) {
                    Text("Ayarlar")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 16)
                    
                    ScrollView {
                        VStack(spacing: 24) {
                            // GENEL
                            VStack(alignment: .leading, spacing: 12) {
                                sectionHeader(text: "GENEL")
                                
                                // Bildirimler Toggle
                                HStack {
                                    Image(systemName: "bell.fill")
                                        .font(.system(size: 22, weight: .semibold))
                                        .foregroundColor(.white)
                                        .frame(width: 30)
                                    
                                    Text("Bildirimler")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Toggle("", isOn: $notificationsEnabled)
                                        .toggleStyle(CustomToggleStyle())
                                        #if compiler(>=5.9)
                                        .onChange(of: notificationsEnabled) { oldValue, newValue in
                                            if newValue {
                                                notificationManager.requestAuthorization()
                                            }
                                        }
                                        #else
                                        .onChange(of: notificationsEnabled) { newValue in
                                            if newValue {
                                                notificationManager.requestAuthorization()
                                            }
                                        }
                                        #endif
                                }
                                .padding(.vertical, 14)
                                .padding(.horizontal, 16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(red: 0.15, green: 0.25, blue: 0.45).opacity(0.5))
                                )
                                
                                menuButton(icon: "info.circle.fill", text: "Hakkımızda") {
                                    showAbout = true
                                }
                                
                                menuButton(icon: "star.fill", text: "Uygulamayı Oyla") {
                                    openURL(URL(string: "https://apps.apple.com/app/id")!)
                                }
                                
                                menuButton(icon: "hand.raised.fill", text: "Gizlilik") {
                                    openURL(URL(string: "https://boykotdedektoru.netlify.app/gizlilik")!)
                                }
                                
                                menuButton(icon: "square.and.arrow.up.fill", text: "Uygulamayı Paylaş") {
                                    let appName = "Boykot Dedektörü"
                                    let message = """
                                    \(appName) ile bilinçli alışveriş yapın! 🛒
                                    
                                    Hangi markaları desteklemeli, hangilerinden uzak durmalı? Hemen öğrenmek için:
                                    """
                                    let appStoreLink = "https://apps.apple.com/tr/app/id" // App Store ID'si eklenecek
                                    
                                    // WhatsApp paylaşımı için
                                    let whatsappMessage = """
                                    \(appName) ile bilinçli alışveriş yapın! 🛒
                                    
                                    Hangi markaları desteklemeli, hangilerinden uzak durmalı? Hemen öğrenmek için:
                                    \(appStoreLink)
                                    """
                                    let whatsappURL = "whatsapp://send?text=\(whatsappMessage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
                                    
                                    // Genel paylaşım için
                                    let items: [Any] = [message, URL(string: appStoreLink)!]
                                    let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
                                    
                                    // Paylaşım seçenekleri
                                    let alert = UIAlertController(title: "Paylaş", message: nil, preferredStyle: .actionSheet)
                                    
                                    // WhatsApp butonu
                                    if let url = URL(string: whatsappURL), UIApplication.shared.canOpenURL(url) {
                                        alert.addAction(UIAlertAction(title: "WhatsApp", style: .default) { _ in
                                            openURL(url)
                                        })
                                    }
                                    
                                    // Diğer paylaşım seçenekleri butonu
                                    alert.addAction(UIAlertAction(title: "Diğer", style: .default) { _ in
                                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                           let window = windowScene.windows.first,
                                           let rootVC = window.rootViewController {
                                            activityVC.popoverPresentationController?.sourceView = rootVC.view
                                            activityVC.popoverPresentationController?.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                                            activityVC.popoverPresentationController?.permittedArrowDirections = []
                                            rootVC.present(activityVC, animated: true)
                                        }
                                    })
                                    
                                    // İptal butonu
                                    alert.addAction(UIAlertAction(title: "İptal", style: .cancel))
                                    
                                    // Alert'i göster
                                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                       let window = windowScene.windows.first,
                                       let rootVC = window.rootViewController {
                                        rootVC.present(alert, animated: true)
                                    }
                                }
                            }
                            
                            // İLETİŞİM
                            VStack(alignment: .leading, spacing: 12) {
                                sectionHeader(text: "İLETİŞİM")
                                
                                menuButton(icon: "lightbulb.fill", text: "Öneri") {
                                    openURL(URL(string: "https://boykotdedektoru.netlify.app/oneriler")!)
                                }
                                menuButton(icon: "exclamationmark.triangle.fill", text: "Marka İtiraz") {
                                    openURL(URL(string: "https://boykotdedektoru.netlify.app/itiraz")!)
                                }
                                menuButton(icon: "envelope.fill", text: "Bize Ulaşın") {
                                    openURL(URL(string: "https://boykotdedektoru.netlify.app/iletisim")!)
                                }
                            }
                            
                            // SOSYAL MEDYA
                            VStack(alignment: .leading, spacing: 12) {
                                sectionHeader(text: "SOSYAL MEDYA")
                                
                                menuButton(icon: "camera.circle.fill", text: "Instagram") {
                                    openURL(URL(string: "https://instagram.com/boykotdedektoru")!)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showAbout) {
                AboutView()
            }
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
