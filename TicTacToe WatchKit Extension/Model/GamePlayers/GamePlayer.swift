import Foundation

protocol GamePlayer {
    func isHuman() -> Bool
    func userName() -> String
    func userCellType() -> CellType
}
