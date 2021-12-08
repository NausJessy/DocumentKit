import CommandKit

/// A command that deletes text from the content of a `Document`.
class DeleteText: Command {

    // MARK: - Properties

    /// The content of the document.
    let content: Document.Content

    /// The range of text to delete.
    let range: Range<String.Index>

    /// The original text, before the insertion was executed.
    let original: String

    // MARK: - Initialiser

    /// Create a new text deletion command.
    ///
    /// - Parameters:
    ///   - content: The content of the document.
    ///   - range: The range of text to delete.
    init(content: Document.Content, range: Range<String.Index>) {
        self.content = content
        self.range = range

        original = content.text
    }

    // MARK: - Command

    func execute() {
        content.text.removeSubrange(range)
    }

    func undo() {
        content.text = original
    }
}
