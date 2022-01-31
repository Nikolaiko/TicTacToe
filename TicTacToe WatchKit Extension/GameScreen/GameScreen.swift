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
                                            print("TURN")
                                            viewModel.makeTurn(cellIndex: i)
                                        }
                                } else {
                                    GamePoleElement(itemState, poleWidth)
                                }
                            }
                        }
                    }
                    .background(.black)
                    Spacer()
                    Text("\(viewModel.currentUser.userName()) turn")
                        .foregroundColor(.black)
                    Spacer()
                }
                Spacer()
            }
        }
        .background(.white)
        .alert(Text("Игра окончена!"), isPresented: $viewModel.showAlert) {
            Button("Еще раз!") {
                viewModel.resetGame()
            }
            Button("Меня мама зовет") {
                navigation.pop()
            }
        } message: {
            switch(viewModel.gameResult) {
            case .inProgress:
                Text("Игра еще в процессе!")
            case .draw:
                Text("Оба молодцы!")
            case .someoneWin:
                Text("\(viewModel.gameWinner!.userName()) победил!")
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
