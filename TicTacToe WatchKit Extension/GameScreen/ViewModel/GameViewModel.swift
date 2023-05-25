import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var boardState: [CellType] = Array(repeating: CellType.empty, count: 9)
    @Published var gameResult: GameResult = GameResult.inProgress
    @Published var currentUser: GamePlayer
    @Published var showAlert: Bool = false

    var gameWinner: GamePlayer?

    private let logic = GameLogic()
//    private let winPaths: Set<Set<Int>> = [
//        [0, 1, 2], [3, 4, 5], [6, 7, 8],
//        [0, 3, 6], [1, 4, 7], [2, 5, 8],
//        [0, 4, 8], [2, 4, 6]
//    ]
    private let playersOrder: PlayersOrder

    init(_ order: PlayersOrder) {
        playersOrder = order
        currentUser = order.getCurrentPlayer()
    }

    init(_ order: PlayersOrder, _ initialBoard: [CellType]) {
        playersOrder = order
        currentUser = order.getCurrentPlayer()

        boardState = initialBoard
    }

    func makeTurn(cellIndex: Int) {
        boardState[cellIndex] = currentUser.userCellType()
        if let winnerType = logic.canAnyTypeWin(boardState: boardState) {
            let firstPlayerType = playersOrder.firstPlayer.userCellType()
            gameWinner = (winnerType == firstPlayerType)
                ? playersOrder.firstPlayer
                : playersOrder.secondPlayer
            gameResult = .someoneWin
            showAlert = true

        } else if checkDrawCondition() {
            gameResult = .draw
            showAlert = true
        } else {

            playersOrder.nextPlayer()
            currentUser = playersOrder.getCurrentPlayer()

            if !currentUser.isHuman() {
                let ai = currentUser as! GameAI
                do {
                    let aiTurn = try ai.makeTurn(gamePole: boardState)
                    boardState[aiTurn.index] = currentUser.userCellType()
                    if let winnerType = logic.canAnyTypeWin(boardState: boardState) {
                        let firstPlayerType = playersOrder.firstPlayer.userCellType()
                        gameWinner = (winnerType == firstPlayerType)
                            ? playersOrder.firstPlayer
                            : playersOrder.secondPlayer
                        gameResult = .someoneWin
                        showAlert = true

                    } else if checkDrawCondition() {
                        gameResult = .draw
                        showAlert = true
                    } else {
                        playersOrder.nextPlayer()
                        currentUser = playersOrder.getCurrentPlayer()
                    }
                } catch {
                    print("Exception! \(error)")
                }
            }
        }
    }

    func resetGame() {
        boardState = Array(repeating: .empty, count: boardState.count)

        playersOrder.resetOrder()
        currentUser = playersOrder.getCurrentPlayer()

        gameResult = .inProgress
        showAlert = false
    }

//    private func checkWinCondition() -> CellType? {
//        let crossIndexs = Set(boardState.indexes(of: .cross))
//        for currentPath in winPaths {
//            if currentPath.isSubset(of: crossIndexs) {
//                return .cross
//            }
//        }
//
//        let zeroIndexs = Set(boardState.indexes(of: .zero))
//        for currentPath in winPaths {
//            if currentPath.isSubset(of: zeroIndexs) {
//                return .zero
//            }
//        }
//        return nil
//    }

    private func checkDrawCondition() -> Bool {
        boardState.filter { item in item == .empty }.isEmpty
    }
}
