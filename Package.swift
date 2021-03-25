// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AmazingDelegateCommand",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "AmazingDelegateCommand",
                 targets: ["AmazingDelegateCommand"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "AmazingDelegateCommand",
            dependencies: []),
        .testTarget(
            name: "AmazingDelegateCommandTests",
            dependencies: ["AmazingDelegateCommand"]),
    ]
)
