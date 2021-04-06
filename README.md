# AmazingDelegateCommand

`AmazingDelegateCommand` – implementation of [`Command`](https://en.wikipedia.org/wiki/Command_pattern) design pattern where command execution is handled by delegate.

## The problem

Let's say that you have `Command` pattern already applied in your programm. And it works fine for global commands like `Edit` and `Save`. But now you want to create a command specific to one of `View Models`. `Archive` command, for example. What do you do? You create a class that implements your command protocol. And here is where the problem arise. You just created a separate class for a command that is tightly coupled with one of your `View Models`.
