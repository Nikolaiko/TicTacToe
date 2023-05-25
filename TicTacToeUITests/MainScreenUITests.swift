import XCTest
import TicTacToe_WatchKit_Extension

class TicTacToeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testMainScreenEasyAIButtonExists() throws {
        let app = XCUIApplication()
        app.launch()

        let easyButton = app.buttons[UITestLabels.easyAIGameButtonTag]
        XCTAssert(easyButton.exists)
    }

    func testMainScreenEasyAIButtonEnabled() throws {
        let app = XCUIApplication()
        app.launch()

        let easyButton = app.buttons[UITestLabels.easyAIGameButtonTag]
        XCTAssert(easyButton.isEnabled)
    }
}
