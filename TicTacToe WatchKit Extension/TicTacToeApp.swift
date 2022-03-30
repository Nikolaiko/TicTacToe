import SwiftUI
import SwiftDevPackage

@main
struct TicTacToeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationControllerView(transition: .custom(.opacity, .slide)) {
                if enterNameScreenFeature {
                    EnterScreenView()
                } else {
                    MainScreenView(userName: "Player")
                }
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
