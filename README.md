# AmazingTargetCommand

`AmazingTargetCommand` is a spin on classic [`Command`](https://en.wikipedia.org/wiki/Command_pattern) design pattern with a Swift version of [`Target-Action`](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html) design pattern on top. Together they will enable you to create commands with ease, without unnecessary repetition and no chance of creating any retencion cycle.

## The problem

Let's say that you have `Command` pattern already applied in your programm. And it works fine for global commands like `Edit` and `Save`. But now you want to create a command specific to one of `View Models`. `Archive` command, for example. What do you do? You create a class that implements your command protocol. And here is where the problem arise. You just created a separate class for a command that is tightly coupled with one of your `View Models`.

## Requirements

- macOS 10.14+
- iOS 11.0+
- tvOS 11.0+
- watchOS 4.0+
- Xcode 11+
- Swift 5.0+

## Installation
### CocoaPods
To integrate `AmazingTargetCommand` into your Xcode project using [CocoaPods](https://cocoapods.org/), specify it in your `Podfile`:
```ruby
pod 'AmazingTargetCommand', '~> 1.0'
```

### Swift Package Manager

To integrate `AmazingTargetCommand` into your Xcode project using [Swift Package Manager](https://swift.org/package-manager/), specify it as dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/khamitimur/AmazingTargetCommand.git", .upToNextMajor(from: "1.0.0"))
]
```

### Git Submodules
To integrate `AmazingTargetCommand` into your workspace using `git` [submodules](https://git-scm.com/docs/git-submodule), open `Terminal` in your top-level project directory and run the following command:
```bash
git submodule add https://github.com/khamitimur/AmazingTargetCommand.git
```

If your project is not initialized as a `git` repository run the following command first:
```bash
git init
```

You'll find new `AmazingTargetCommand` folder. Open it and drag and drop `AmazingTargetCommand.xcodeproj` into your project in the project navigator in `Xcode`. Or into the project navigator root if you're working with `Workspace`.

Select your project and add `AmazingTargetCommand.framework` under `General -> Frameworks and Libraries`.

### Manually
Drag and drop `AmazingTargetCommand.xcodeproj` into your project in the project navigator in `Xcode`. Or into the project navigator root if you're working with `Workspace`.

Select your project and add `AmazingTargetCommand.framework` under `General -> Frameworks and Libraries`.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

* Any similarity with the [`DelegateCommand`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.platformui.delegatecommand) is deliberate 🙂
* Implemenation of `Target-Action` design pattern in Swift was inspired by [the article](https://oleb.net/blog/2014/07/swift-instance-methods-curried-functions/) by [Ole Begemann](https://oleb.net/).
