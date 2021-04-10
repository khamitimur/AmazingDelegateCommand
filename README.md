# AmazingTargetCommand

`AmazingTargetCommand` is a spin on classic [`Command`](https://en.wikipedia.org/wiki/Command_pattern) design pattern with a Swift version of [`Target-Action`](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html) design pattern on top. Together they will enable you to create commands with ease, without unnecessary repetition and no chances of creating retencion cycles.

## The problem

Let's say that you have `Command` pattern already applied in your programm. And it works fine for global commands like `Edit` and `Save`. But now you want to create a command specific to one of `View Models`. `Archive` command, for example. What do you do? You create a class that implements your command protocol. And here is where the problem arise. You just created a separate class for a command that is tightly coupled with one of your `View Models`.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

* Any similarity with [`DelegateCommand`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.platformui.delegatecommand) is deliberate 🙂
* Implemenation of `Target-Action` design pattern in Swift was inspired by [the article](https://oleb.net/blog/2014/07/swift-instance-methods-curried-functions/) by [Ole Begemann](https://oleb.net/).
