import Foundation

struct EasyAI: GameAI {
    public static let ERROR_MESSAGE = "No Empty Cells"
    
    let playerCellType: CellType
    
    func makeTurn(gamePole: [CellType]) throws -> GameTurn {
        var freeCells = gamePole.filter { currentItem in
            currentItem == .empty
        }
        
        if freeCells.isEmpty {
            throw GameError.aiTurnError(EasyAI.ERROR_MESSAGE)
        }
        freeCells.shuffle()
        
        let index = gamePole.firstIndex(of: freeCells.first!)!
        return GameTurn(type: playerCellType, index: index)
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
