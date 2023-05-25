import XCTest

class GameUITests: XCTestCase {
    private let cell0 = "\(UITestLabels.gamePoleCellTag)0"
    private let cell1 = "\(UITestLabels.gamePoleCellTag)1"
    private let cell2 = "\(UITestLabels.gamePoleCellTag)2"
    private let cell3 = "\(UITestLabels.gamePoleCellTag)3"
    private let cell4 = "\(UITestLabels.gamePoleCellTag)4"
    private let cell5 = "\(UITestLabels.gamePoleCellTag)5"
    private let cell6 = "\(UITestLabels.gamePoleCellTag)6"
    private let cell7 = "\(UITestLabels.gamePoleCellTag)7"
    private let cell8 = "\(UITestLabels.gamePoleCellTag)8"

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testGamePoleExist() throws {
        let app = XCUIApplication()
        app.launch()

        let easyButton = app.buttons[UITestLabels.easyAIGameButtonTag]
        easyButton.tap()

        let gamePole = app.otherElements[UITestLabels.gamePoleGridTag]
        XCTAssert(gamePole.waitForExistence(timeout: 1.0))
    }

    func testGamePoleCellsExists() throws {
        let app = XCUIApplication()
        app.launch()

        let easyButton = app.buttons[UITestLabels.easyAIGameButtonTag]
        easyButton.tap()

        let gamePoleCell0 = app.otherElements[cell0]
        XCTAssert(gamePoleCell0.waitForExistence(timeout: 1.0))

        let gamePoleCell1 = app.otherElements[cell1]
        XCTAssert(gamePoleCell1.waitForExistence(timeout: 1.0))

        let gamePoleCell2 = app.otherElements[cell2]
        XCTAssert(gamePoleCell2.waitForExistence(timeout: 1.0))

        let gamePoleCell3 = app.otherElements[cell3]
        XCTAssert(gamePoleCell3.waitForExistence(timeout: 1.0))

        let gamePoleCell4 = app.otherElements[cell4]
        XCTAssert(gamePoleCell4.waitForExistence(timeout: 1.0))

        let gamePoleCell5 = app.otherElements[cell5]
        XCTAssert(gamePoleCell5.waitForExistence(timeout: 1.0))

        let gamePoleCell6 = app.otherElements[cell6]
        XCTAssert(gamePoleCell6.waitForExistence(timeout: 1.0))

        let gamePoleCell7 = app.otherElements[cell7]
        XCTAssert(gamePoleCell7.waitForExistence(timeout: 1.0))

        let gamePoleCell8 = app.otherElements[cell8]
        XCTAssert(gamePoleCell8.waitForExistence(timeout: 1.0))
    }

    func testGamePoleCellsEnabledAtStart() throws {
        let app = XCUIApplication()
        app.launch()

        let easyButton = app.buttons[UITestLabels.easyAIGameButtonTag]
        easyButton.tap()

        let gamePoleCell0 = app.otherElements[cell0]
        XCTAssert(gamePoleCell0.isEnabled)

        let gamePoleCell1 = app.otherElements[cell1]
        XCTAssert(gamePoleCell1.isEnabled)

        let gamePoleCell2 = app.otherElements[cell2]
        XCTAssert(gamePoleCell2.isEnabled)

        let gamePoleCell3 = app.otherElements[cell3]
        XCTAssert(gamePoleCell3.isEnabled)

        let gamePoleCell4 = app.otherElements[cell4]
        XCTAssert(gamePoleCell4.isEnabled)

        let gamePoleCell5 = app.otherElements[cell5]
        XCTAssert(gamePoleCell5.isEnabled)

        let gamePoleCell6 = app.otherElements[cell6]
        XCTAssert(gamePoleCell6.isEnabled)

        let gamePoleCell7 = app.otherElements[cell7]
        XCTAssert(gamePoleCell7.isEnabled)

        let gamePoleCell8 = app.otherElements[cell8]
        XCTAssert(gamePoleCell8.isEnabled)
    }
}
