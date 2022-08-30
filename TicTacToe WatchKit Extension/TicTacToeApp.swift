import SwiftUI
import SwiftDevPackage

@main
struct TicTacToeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationControllerView(transition: .custom(.opacity, .slide)) {
                MainScreenView(userName: "Player")
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
