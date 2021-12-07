import Foundation

/// Compose multiple commands by adding child commands.
class CompositeCommand: Command {
    /// A list of child commands.
    private var children: [Command] = []

    /// Add a child command to execute.
    ///
    /// - Parameter child: The child command to execute.
    func add(_ child: Command) {
        children.append(child)
    }

    func execute() {
        children.forEach { $0.execute() }
    }

    func undo() {
        children.forEach { $0.undo() }
    }

    /// The number of child commands.
    var count: Int {
        children.count
    }
}
