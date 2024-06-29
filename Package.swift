// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swifthon",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "Swifthon",
            targets: ["Swifthon"]),
    ],
    targets: [
       .target(
            name: "Swifthon"),
        .testTarget(
            name: "SwifthonTests",
            dependencies: ["Swifthon"]),
    ]
)
