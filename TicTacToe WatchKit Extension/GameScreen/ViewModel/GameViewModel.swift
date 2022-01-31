import Foundation


class GameViewModel: ObservableObject {
    @Published var boardState: [CellType] = Array(repeating: CellType.empty, count: 9)
    @Published var currentUser: GamePlayer
    
    private let playersOrder: PlayersOrder
    
    init(_ order: PlayersOrder) {
        playersOrder = order
        currentUser = order.getCurrentPlayer()
    }
    
    func makeTurn(cellIndex: Int) {
        
    }
}
