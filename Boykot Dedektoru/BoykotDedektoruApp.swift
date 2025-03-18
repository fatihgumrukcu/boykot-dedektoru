import SwiftUI
@main
struct BoykotDedektoruApp: App {
    @StateObject private var notificationManager = NotificationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    notificationManager.requestAuthorization()
                }
        }
    }
}

