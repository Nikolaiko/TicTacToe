import SwiftUI
import Combine
import SwiftDevPackage

struct GameScreen: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @ObservedObject var viewModel: GameViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let poleWidth = geometry.size.width
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    VStack {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(0..<9) { i in
                                let itemState = viewModel.boardState[i]
                                if viewModel.currentUser.isHuman() && itemState == .empty {
                                    GamePoleElement(itemState, poleWidth)
                                        .onTapGesture {
                                            viewModel.makeTurn(cellIndex: i)
                                        }
                                        .accessibilityLabel("\(UITestLabels.gamePoleCellTag)\(i)")
                                } else {
                                    GamePoleElement(itemState, poleWidth)
                                        .accessibilityLabel("\(UITestLabels.gamePoleCellTag)\(i)")
                                }
                            }
                        }
                        .accessibilityLabel(UITestLabels.gamePoleGridTag)
                    }
                    .background(.black)
                    Spacer()
                    Text("\(viewModel.currentUser.userName()) turn")
                        .foregroundColor(.black)
                        .accessibilityLabel(UITestLabels.activeUserLabeTag)
                    Spacer()
                }
                Spacer()
            }
        }
        .background(.white)
        .alert(Text("???????? ????????????????!"), isPresented: $viewModel.showAlert) {
            Button("?????? ??????!") {
                viewModel.resetGame()
            }
            Button("???????? ???????? ??????????") {
                navigation.pop()
            }
        } message: {
            switch(viewModel.gameResult) {
            case .inProgress:
                Text("???????? ?????? ?? ????????????????!")
            case .draw:
                Text("?????? ??????????????!")
            case .someoneWin:
                Text("\(viewModel.gameWinner!.userName()) ??????????????!")
            }
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(viewModel: GameViewModel(
            PlayersOrder(EasyAI(playerCellType: .cross), EasyAI(playerCellType: .zero))
        ))
    }
}
