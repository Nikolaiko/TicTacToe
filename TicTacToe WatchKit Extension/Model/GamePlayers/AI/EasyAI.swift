import Foundation

struct EasyAI: GameAI {
    public static let ERROR_MESSAGE = "No Empty Cells"
    
    let playerCellType: CellType
    
    func makeTurn(gamePole: [CellType]) throws -> GameTurn {
        var freeCells = Array(gamePole.indexes(of: .empty))
        
        if freeCells.isEmpty {
            throw GameError.aiTurnError(EasyAI.ERROR_MESSAGE)
        }
        freeCells.shuffle()
        return GameTurn(type: playerCellType, index: freeCells.first!)
    }
    
    func isHuman() -> Bool {
        false
    }
    
    func userName() -> String {
        "Easy AI"
    }
    
    func userCellType() -> CellType {
        playerCellType
    }
}
