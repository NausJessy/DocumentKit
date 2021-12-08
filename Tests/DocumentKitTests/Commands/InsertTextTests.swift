import XCTest
@testable import DocumentKit

final class InsertTextTests: XCTestCase {

    var document: Document!

    // MARK: - Setup

    override func setUp() {
        document = Document()
    }

    // MARK: - Tests

    func testExecuteAndUndo() throws {
        // Given
        let text = "Hello Beam!"

        let insertTextCommand = InsertText(
            content: document.content,
            index: document.content.text.startIndex,
            text: text
        )

        // When
        try insertTextCommand.execute()

        // Then
        XCTAssertEqual(document.content.text, text)

        // When
        insertTextCommand.undo()

        // Then
        XCTAssertEqual(document.content.text, "")
    }

    func testExecuteThrows() throws {
        // Given
        let text = "Hello Beam!"

        let insertTextCommand1 = InsertText(
            content: document.content,
            index: document.content.text.startIndex,
            text: text
        )
        try insertTextCommand1.execute()

        let insertTextCommand2 = InsertText(
            content: document.content,
            index: document.content.text.endIndex,
            text: text
        )
        insertTextCommand1.undo()

        // Then
        XCTAssertThrowsError(try insertTextCommand2.execute())
        XCTAssertEqual(document.content.text, "")
    }
}
