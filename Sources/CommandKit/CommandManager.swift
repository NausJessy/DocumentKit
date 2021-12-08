import Foundation

/// An object that manages the executed commands.
public class CommandManager {

    // MARK: - Properties

    /// The list of past commands.
    var passedCommands: [Command] = []

    /// The list of futur commands.
    var futureCommands: [Command] = []

    // MARK: - Initializer

    /// Create a new instance.
    public init() {}

    // MARK: - API

    /// Execute the passed in command.
    public func execute(_ command: Command) {
        perform(command)

        if !futureCommands.isEmpty {
            futureCommands.removeAll()
        }
    }

    /// Undo the last command.
    public func undo() {
        if let command = passedCommands.popLast() {
            command.undo()
            futureCommands.append(command)
        }
    }

    /// Redo the last previously undone command.
    public func redo() {
        futureCommands.popLast().flatMap(perform(_:))
    }

    // MARK: - Helper

    /// Perform the command and append it to the list of passed commands.
    ///
    /// - Parameter command: The command to perform.
    private func perform(_ command: Command) {
        do {
            try command.execute()
            passedCommands.append(command)
        } catch {
            command.undo()
        }
    }
}
