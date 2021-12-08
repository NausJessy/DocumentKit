import CommandKit

/// A command that inserts text into the content of a `Document`.
class InsertText: Command {

    // MARK: - Properties

    /// The content of the document.
    let content: Document.Content

    /// The position at which to insert the text.
    let index: String.Index

    /// The text to insert.
    let text: String

    /// The original text, before the insertion was executed.
    let original: String

    // MARK: - Initialiser

    /// Create a new text insertion command.
    ///
    /// - Parameters:
    ///   - content: The content of the document.
    ///   - index: The position at which to insert the text.
    ///   - text: The text to insert.
    init(content: Document.Content, index: String.Index, text: String) {
        self.content = content
        self.index = index
        self.text = text

        original = content.text
    }

    // MARK: - Command

    func execute() throws {
        guard content.text.startIndex <= index && index <= content.text.endIndex else {
            throw CommandError.indexOutOfBounds
        }
        content.text.insert(contentsOf: text, at: index)
    }

    func undo() {
        content.text = original
    }
}
