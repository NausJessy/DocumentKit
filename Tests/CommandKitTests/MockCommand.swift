import CommandKit

class MockCommand: Command {
    var didExecute: Bool = false
    var didUndo: Bool = false

    init() {}

    func execute() {
        didExecute = true
        didUndo = false
    }

    func undo() {
        didExecute = false
        didUndo = true
    }
}
