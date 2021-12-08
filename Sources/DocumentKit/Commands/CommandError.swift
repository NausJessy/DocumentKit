import Foundation

/// An enumeration of the different errors a `Command` can throw
/// while working on a `Document`.
enum CommandError: Error {

    /// Indicates that the command operated on an index
    /// that is out of bounds.
    case indexOutOfBounds

}
