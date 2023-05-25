import XCTest

@testable import TicTacToe_WatchKit_Extension

class EasyAITests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testEasyAIMakeTurnEmptyBoard() {
        let boardState: [CellType] = Array(repeating: .empty, count: 9)
        let aiCellType: CellType = .cross
        let easyAI = EasyAI(playerCellType: aiCellType)
        let turn = try! easyAI.makeTurn(gamePole: boardState)

        XCTAssert(boardState[turn.index] == .empty)
    }

    func testEasyAIMakeTurnNotEmptyBoard() {
        var boardState: [CellType] = Array(repeating: .empty, count: 9)

        var randomIndex = Int(arc4random_uniform(UInt32(boardState.count)))
        boardState[randomIndex] = .zero

        randomIndex = Int(arc4random_uniform(UInt32(boardState.count)))
        boardState[randomIndex] = .zero

        randomIndex = Int(arc4random_uniform(UInt32(boardState.count)))
        boardState[randomIndex] = .zero

        let aiCellType: CellType = .cross
        let easyAI = EasyAI(playerCellType: aiCellType)
        let turn = try! easyAI.makeTurn(gamePole: boardState)

        XCTAssert(boardState[turn.index] == .empty)
    }

    func testEasyAIFailsToMakeTurnOnFullBoard() {
        let boardState: [CellType] = Array(repeating: .zero, count: 9)
        let aiCellType: CellType = .cross
        let easyAI = EasyAI(playerCellType: aiCellType)

        XCTAssertThrowsError(try easyAI.makeTurn(gamePole: boardState)) { error in
            XCTAssertEqual(error as? GameError, GameError.aiTurnError(EasyAI.ERROR_MESSAGE))
        }
    }
}
