import Foundation

class PlayersOrder {
    private static let FIRST_PLAYER_INDEX = 0
    private static let SECOND_PLAYER_INDEX = 1
    
    private var currentPlayerIndex: Int
    private let firstPlayer: GamePlayer
    private let secondPlayer: GamePlayer
    
    init(_ first: GamePlayer, _ second: GamePlayer) {
        firstPlayer = first
        secondPlayer = second
        currentPlayerIndex = PlayersOrder.FIRST_PLAYER_INDEX
    }
    
    func getCurrentPlayer() -> GamePlayer {
        return (currentPlayerIndex == PlayersOrder.FIRST_PLAYER_INDEX)
            ? firstPlayer
            : secondPlayer
    }
    
    func nextPlayer() {
        currentPlayerIndex = (currentPlayerIndex == PlayersOrder.FIRST_PLAYER_INDEX)
            ? PlayersOrder.SECOND_PLAYER_INDEX
            : PlayersOrder.FIRST_PLAYER_INDEX
    }
}
