// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SweetNetworking",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", exact: "1.6.1"),
    ],
    targets: [
        .executableTarget(
            name: "sweetnet", 
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
        ),
    ]
)
