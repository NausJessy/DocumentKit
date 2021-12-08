# DocumentKit

DocumentKit is a proof of concept demonstrating the [Command Pattern](https://en.wikipedia.org/wiki/Command_pattern). It
is divided into two parts:

* CommandKit containing the definition of a `Command` and a `CommandManager` capable of executing, undoing and redoing
`Command`s.
* DocumentKit containing a `Document` class representing the content of document, with two concret implementations of
the `Command` interface, i.e. `DeleteText` and `InsertText`.
