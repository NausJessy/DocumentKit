import XCTest
@testable import DocumentKit

final class InsertTextTests: XCTestCase {

    var document: Document!

    // MARK: - Setup

    override func setUp() {
        document = Document()
    }

    // MARK: - Tests

    func testExecuteAndUndo() {
        // Given
        let text = "Hello Beam!"

        let insertTextCommand = InsertText(
            content: document.content,
            index: document.content.text.startIndex,
            text: text
        )

        // When
        insertTextCommand.execute()

        // Then
        XCTAssertEqual(document.content.text, text)

        // When
        insertTextCommand.undo()

        // Then
        XCTAssertEqual(document.content.text, "")
    }

}
