import SwiftUI
import SwiftDevPackage

struct MainScreenView: View {
    let userName: String
    @EnvironmentObject private var navigation: NavigationControllerViewModel

    var body: some View {
        VStack {
            Button {
                let userPlayer = UserPlayer(userName, .cross)
                let aiPlayer = EasyAI(playerCellType: .zero)
                let model = GameViewModel(PlayersOrder(userPlayer, aiPlayer))
                navigation.push(GameScreen(viewModel: model))
            } label: {
                Text("Младший брат")
            }
            .accessibilityLabel(UITestLabels.easyAIGameButtonTag)

            Button {
                let userPlayer = UserPlayer("Player", .cross)
                let aiPlayer = NormalAI(playerCellType: .zero)
                let model = GameViewModel(PlayersOrder(userPlayer, aiPlayer))
                navigation.push(GameScreen(viewModel: model))
            } label: {
                Text("Твой Батя")
            }
            .accessibilityLabel(UITestLabels.easyAIGameButtonTag)
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(userName: "Player")
    }
}
