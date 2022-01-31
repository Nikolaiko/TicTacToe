import Foundation

protocol GameAI: GamePlayer {
    func makeTurn(gamePole: [CellType]) throws -> GameTurn
}
