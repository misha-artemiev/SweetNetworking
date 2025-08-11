// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SweetNetworking",
    platforms: [
        .macOS(.v14),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", exact: "1.6.1"),
        .package(url: "https://github.com/swiftlang/swift-subprocess.git", revision: "7fb7ee86df8ca4f172697bfbafa89cdc583ac016"),
    ],
    targets: [
        .executableTarget(
            name: "sweetnet", 
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Subprocess", package: "swift-subprocess")
            ],
        ),
    ]
)
