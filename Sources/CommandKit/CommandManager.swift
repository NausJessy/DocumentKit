import Foundation

/// An object that manages the executed commands.
public class CommandManager {

    /// The list of past commands.
    var passedCommands: [Command] = []

    /// The list of futur commands.
    var futureCommands: [Command] = []

    /// Create a new instance.
    public init() {}

    /// Execute the passed in command.
    public func execute(_ command: Command) {
        command.execute()

        passedCommands.append(command)

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
        if let command = futureCommands.popLast() {
            command.execute()
            passedCommands.append(command)
        }
    }
}
