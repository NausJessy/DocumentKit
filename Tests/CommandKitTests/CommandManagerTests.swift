import XCTest
@testable import CommandKit

final class CommandManagerTests: XCTestCase {

    var commandManager: CommandManager!

    override func setUp() {
        super.setUp()
        commandManager = CommandManager()
    }

    func testExecuteCommand() {
        // Given
        let command = MockCommand()

        // When
        commandManager.execute(command)

        // Then
        XCTAssertTrue(command.didExecute)
        XCTAssertFalse(command.didUndo)

        XCTAssertEqual(commandManager.passedCommands.count, 1)
        XCTAssertEqual(commandManager.futureCommands.count, 0)
    }

    func testUndoCommand() {
        // Given
        let command = MockCommand()
        commandManager.execute(command)

        // When
        commandManager.undo()

        // Then
        XCTAssertFalse(command.didExecute)
        XCTAssertTrue(command.didUndo)

        XCTAssertEqual(commandManager.passedCommands.count, 0)
        XCTAssertEqual(commandManager.futureCommands.count, 1)
    }

    func testRedoCommand() {
        // Given
        let command = MockCommand()
        commandManager.execute(command)
        commandManager.undo()

        // When
        commandManager.redo()

        // Then
        XCTAssertTrue(command.didExecute)
        XCTAssertFalse(command.didUndo)

        XCTAssertEqual(commandManager.passedCommands.count, 1)
        XCTAssertEqual(commandManager.futureCommands.count, 0)
    }

    func testExecuteCommandClearsFutureCommandsArray() {
        // Given
        let command = MockCommand()
        commandManager.execute(command)
        commandManager.execute(command)
        commandManager.undo()

        // When
        commandManager.execute(command)

        // Then
        XCTAssertTrue(command.didExecute)
        XCTAssertFalse(command.didUndo)

        XCTAssertEqual(commandManager.passedCommands.count, 2)
        XCTAssertEqual(commandManager.futureCommands.count, 0)
    }

    func testThrowingCommandUndosCommand() {
        // Given
        let command = ThrowingCommand()

        // When
        commandManager.execute(command)

        // Then
        XCTAssertTrue(command.didUndo)

        XCTAssertEqual(commandManager.passedCommands.count, 0)
        XCTAssertEqual(commandManager.futureCommands.count, 0)
    }
}
