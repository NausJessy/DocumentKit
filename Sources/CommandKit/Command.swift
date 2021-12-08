/// A type that executes some work while being able to revert to the initial state.
public protocol Command {

    /// Execute the command.
    func execute() throws

    /// Revert the work performed by the command.
    func undo()

}
