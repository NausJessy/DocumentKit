import XCTest
@testable import DocumentKit

final class DeleteTextTests: XCTestCase {

    var document: Document!

    // MARK: - Setup

    override func setUp() {
        document = Document()
    }

    // MARK: - Tests

    func testExecuteAndUndo() throws {
        // Given
        let content = "Hello Beam!"
        document.content.text = content

        let range = content.range(of: " Beam")!

        let deleteTextCommand = DeleteText(
            content: document.content,
            range: range
        )

        // When
        try deleteTextCommand.execute()

        // Then
        XCTAssertEqual(document.content.text, content.replacingOccurrences(of: " Beam", with: ""))

        // When
        deleteTextCommand.undo()

        // Then
        XCTAssertEqual(document.content.text, content)
    }

    func testExecuteThrows() {
        // Given
        let content = "Hello Beam!"
        document.content.text = content

        // When
        let range = content.range(of: " Beam")!

        let deleteTextCommand = DeleteText(
            content: document.content,
            range: range
        )
        try? deleteTextCommand.execute()

        // Then
        XCTAssertThrowsError(try deleteTextCommand.execute())
        XCTAssertEqual(document.content.text, content.replacingOccurrences(of: " Beam", with: ""))
    }
}
