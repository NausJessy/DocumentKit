import XCTest
@testable import DocumentKit

final class DeleteTextTests: XCTestCase {

    var document: Document!

    // MARK: - Setup

    override func setUp() {
        document = Document()
    }

    // MARK: - Tests

    func testExecuteAndUndo() {
        // Given
        let content = "Hello Beam!"
        document.content.text = content

        let range = content.range(of: " Beam")!

        let deleteTextCommand = DeleteText(
            content: document.content,
            range: range
        )

        // When
        deleteTextCommand.execute()

        // Then
        XCTAssertEqual(document.content.text, content.replacingOccurrences(of: " Beam", with: ""))

        // When
        deleteTextCommand.undo()

        // Then
        XCTAssertEqual(document.content.text, content)
    }

}
