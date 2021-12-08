import Foundation

/// Compose multiple commands by adding child commands.
public class CompositeCommand: Command {
    /// A list of child commands.
    var children: [Command] = []

    /// Add a child command to execute.
    ///
    /// - Parameter child: The child command to execute.
    public func add(_ child: Command) {
        children.append(child)
    }

    public func execute() throws {
        try children.forEach { command in
            try command.execute()
        }
    }

    public func undo() {
        children.forEach { $0.undo() }
    }

    /// The number of child commands.
    public var count: Int {
        children.count
    }
}
