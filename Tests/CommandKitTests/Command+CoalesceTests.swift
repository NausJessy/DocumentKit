import XCTest
@testable import CommandKit

final class Command_CoalesceTests: XCTestCase {

    func testCoalesceCommand() {
        // Given
        let command1 = MockCommand()
        let command2 = MockCommand()

        // When
        let compositeCommand = command1.coalesce(command2)

        // Then
        XCTAssertEqual(compositeCommand.count, 2)
    }

    func testCoalesceCompositeCommand() {
        // Given
        let compositeCommand = CompositeCommand()

        // When
        compositeCommand.coalesce(MockCommand())

        // Then
        XCTAssertEqual(compositeCommand.count, 1)
    }
}
