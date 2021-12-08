import CommandKit

class ThrowingCommand: Command {
    enum ThrowingError: Error {
        case failure
    }

    var didUndo: Bool = false

    init() {}

    func execute() throws {
        throw ThrowingError.failure
    }

    func undo() {
        didUndo = true
    }
}
