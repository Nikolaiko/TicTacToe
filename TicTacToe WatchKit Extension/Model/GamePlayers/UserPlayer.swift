import Foundation


struct UserPlayer: GamePlayer {
    private let name: String
    private let playerCellType: CellType
    
    init(_ playerName: String, _ cellType: CellType) {
        name = playerName
        playerCellType = cellType
    }
    
    func userName() -> String {
        name
    }
    
    func isHuman() -> Bool {
        true
    }
    
    func userCellType() -> CellType {
        playerCellType
    }
}
