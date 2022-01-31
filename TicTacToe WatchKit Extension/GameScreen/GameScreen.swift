import SwiftUI

struct GameScreen: View {
    let viewModel: GameViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    VStack {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(0..<9) { i in
                                GamePoleElement(
                                    viewModel.boardState[i],
                                    geometry.size.width
                                )
                            }
                        }
                    }
                    .background(.black)
                    Spacer()
                }
                Spacer()
            }
            
            
        }
        .background(.white)
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(viewModel: GameViewModel(
            PlayersOrder(EasyAI(playerCellType: .cross), EasyAI(playerCellType: .zero))
        ))
    }
}
