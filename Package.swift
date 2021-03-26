// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AmazingDelegateCommand",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "AmazingDelegateCommand",
            targets: ["AmazingDelegateCommand"]),
    ],
    dependencies: [
        .package(url: "https://github.com/khamitimur/AmazingWeakSequence",
                 from: "1.0.0")
    ],
    targets: [
        .target(
            name: "AmazingDelegateCommand",
            dependencies: [
                "AmazingWeakSequence"
            ]),
        .testTarget(
            name: "AmazingDelegateCommandTests",
            dependencies: [
                "AmazingDelegateCommand"
            ]),
    ]
)
