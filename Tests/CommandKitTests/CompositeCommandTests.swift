import XCTest
@testable import CommandKit

final class CompositeCommandTests: XCTestCase {

    func testAddChildren() {
        // Given
        let compositeCommand = CompositeCommand()

        // Then
        XCTAssertEqual(compositeCommand.count, 0)

        // When
        compositeCommand.add(MockCommand())

        // Then
        XCTAssertEqual(compositeCommand.count, 1)
    }

    func testExecute() throws {
        // Given
        let command = MockCommand()
        
        // When
        let composite = CompositeCommand()
        composite.add(command)

        try composite.execute()

        // Then
        XCTAssertTrue(command.didExecute)
        XCTAssertFalse(command.didUndo)
    }

    func testUndo() throws {
        // Given
        let command = MockCommand()

        // When
        let composite = CompositeCommand()
        composite.add(command)
        try composite.execute()
        composite.undo()

        // Then
        XCTAssertFalse(command.didExecute)
        XCTAssertTrue(command.didUndo)
    }
}
