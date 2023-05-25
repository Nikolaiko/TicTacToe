import Foundation

struct GameLogic {

    private let winPaths: Set<Set<Int>> = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    func checkWinTurnForType(boardState: [CellType], type: CellType) -> Int? {
        let itemIndexs = Set(boardState.indexes(of: type))
        for currentPath in winPaths {
            let notInSet = currentPath.subtracting(itemIndexs)
            if notInSet.count == 1 {
                if boardState[notInSet.first!] == .empty {
                    return notInSet.first!
                }
            }
        }
        return nil
    }

    func checkWinForType(boardState: [CellType], type: CellType) -> Bool {
        let itemIndexs = Set(boardState.indexes(of: type))
        for currentPath in winPaths {
            if currentPath.isSubset(of: itemIndexs) {
                return true
            }
        }
        return false
    }

    func canAnyTypeWin(boardState: [CellType]) -> CellType? {
        let crossCanWin = checkWinForType(boardState: boardState, type: .cross)
        if crossCanWin {
            return .cross
        }

        let zeroCanWin = checkWinForType(boardState: boardState, type: .zero)
        if zeroCanWin {
            return .zero
        }
        return nil
    }
}
