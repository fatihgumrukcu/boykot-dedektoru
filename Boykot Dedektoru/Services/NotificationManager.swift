import Foundation
import UserNotifications
import UIKit
import SwiftUI

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()
    
    @Published var isAuthorized = false
    @AppStorage("notificationsEnabled") var notificationsEnabled = false
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        checkAuthorizationStatus()
    }
    
    func checkAuthorizationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.isAuthorized = settings.authorizationStatus == .authorized
                self.notificationsEnabled = settings.authorizationStatus == .authorized
            }
        }
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            DispatchQueue.main.async {
                self.isAuthorized = success
                self.notificationsEnabled = success
                if success {
                    print("Bildirim izni alındı")
                } else if let error = error {
                    print("Bildirim izni alınamadı: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func sendTestNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Test Bildirimi"
        content.body = "Bu bir test bildirimidir! 🔔"
        content.sound = .default
        
        // Bildirimi 1 saniye sonra göster
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Bildirim gönderilemedi: \(error.localizedDescription)")
            } else {
                print("Test bildirimi başarıyla gönderildi")
            }
        }
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let identifier = response.notification.request.identifier
        print("Bildirime tıklandı: \(identifier)")
        
        if #available(iOS 17.0, *) {
            // iOS 17 ve sonrası için yeni API
            UNUserNotificationCenter.current().setBadgeCount(0) { error in
                if let error = error {
                    print("Badge sıfırlanırken hata oluştu: \(error.localizedDescription)")
                }
            }
        } else {
            // iOS 16 ve öncesi için eski API
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        
        completionHandler()
    }
}

