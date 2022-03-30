import Foundation

struct NormalAI: GameAI {
    private let logic = GameLogic()
    
    let playerCellType: CellType
    
    func makeTurn(gamePole: [CellType]) throws -> GameTurn {
        let oppositePlayer = getOppositeType()
        let oppositeWinTurn = logic.checkWinTurnForType(boardState: gamePole, type: oppositePlayer)
        let ourWinTurn = logic.checkWinTurnForType(boardState: gamePole, type: playerCellType)
        
        var cellIndex: Int = -1
        
        if ourWinTurn != nil {
            cellIndex = ourWinTurn!
        } else if oppositeWinTurn != nil {
            cellIndex = oppositeWinTurn!
        } else if (gamePole[MIDDLE_CELL_INDEX] == .empty) {
            cellIndex = MIDDLE_CELL_INDEX
        } else {
            cellIndex = try makeRandomTurn(gamePole: gamePole)
        }
        return GameTurn(type: playerCellType, index: cellIndex)
    }
    
    func isHuman() -> Bool {
        false
    }
    
    func userName() -> String {
        "Твой Батя"
    }
    
    func userCellType() -> CellType {
        playerCellType
    }
    
    private func getOppositeType() -> CellType {
        return playerCellType == .cross ? .zero : .cross
    }
    
    private func makeRandomTurn(gamePole: [CellType]) throws -> Int  {
        var freeCells = Array(gamePole.indexes(of: .empty))
        
        if freeCells.isEmpty {
            throw GameError.aiTurnError(ERROR_MESSAGE)
        }
        freeCells.shuffle()
        return freeCells.first!
    }
}
