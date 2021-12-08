import CommandKit

/// A document to which one can add content.
public class Document {

    /// The current content of the document.
    public let content = Content()

    /// A command manager that keeps a history of the changes applied to
    /// the content of the document so that they can be undone or redone.
    let manager = CommandManager()
}

// MARK: - Content

extension Document {

    /// A container for the content of the document.
    public class Content {

        /// The current text representation of the document.
        public var text: String

        /// Initialize the content of the document.
        ///
        /// - Parameter text: The text representation of the document.
        ///   Defaults to an empty string.
        init(_ text: String = "") {
            self.text = text
        }
    }
}
