import Foundation

public extension Command {

    /// Coalesce one command with another.
    ///
    /// The result will be a composite command running the commands in order.
    ///
    /// - Parameter command: The command to coalesce.
    ///
    /// - Returns: A composite command.
    func coalesce(_ command: Command) -> CompositeCommand {
        let composite = CompositeCommand()
        composite.add(self)
        composite.add(command)
        return composite
    }

}

public extension CompositeCommand {

    /// Coalesce one command with the current composite command.
    ///
    /// - Parameter command: The command to coalesce.
    ///
    /// - Returns: A composite command.
    @discardableResult
    func coalesce(_ command: Command) -> CompositeCommand {
        add(command)
        return self
    }
}

