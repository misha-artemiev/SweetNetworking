// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "SweetNetworking",
    platforms: [
        .macOS(.v13),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", exact: "1.6.1"),
        .package(url: "https://github.com/swiftlang/swift-subprocess.git", revision: "f9881e5"),
    ],
    targets: [
        .executableTarget(
            name: "SweetNetworking",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Subprocess", package: "swift-subprocess"),
            ],
        ),
    ]
)
