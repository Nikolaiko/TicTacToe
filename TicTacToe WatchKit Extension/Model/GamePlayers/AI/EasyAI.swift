import Foundation

struct EasyAI: GameAI {
    let playerCellType: CellType

    func makeTurn(gamePole: [CellType]) throws -> GameTurn {
        var freeCells = Array(gamePole.indexes(of: .empty))

        if freeCells.isEmpty {
            throw GameError.aiTurnError(ERROR_MESSAGE)
        }
        freeCells.shuffle()
        return GameTurn(type: playerCellType, index: freeCells.first!)
    }

    func isHuman() -> Bool {
        false
    }

    func userName() -> String {
        "Младший братик"
    }

    func userCellType() -> CellType {
        playerCellType
    }
}
