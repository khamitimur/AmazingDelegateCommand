// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AmazingTargetCommand",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "AmazingTargetCommand",
            targets: ["AmazingTargetCommand"]),
    ],
    dependencies: [
        .package(url: "https://github.com/khamitimur/AmazingWeakSequence",
                 .upToNextMajor(from: "1.2.0"))
    ],
    targets: [
        .target(
            name: "AmazingTargetCommand",
            dependencies: [
                "AmazingWeakSequence"
            ]),
        .testTarget(
            name: "AmazingTargetCommandTests",
            dependencies: [
                "AmazingTargetCommand"
            ]),
    ]
)
