// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DocumentKit",
    products: [
        .library(
            name: "CommandKit",
            targets: ["CommandKit"]),
        .library(
            name: "DocumentKit",
            targets: ["DocumentKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CommandKit",
            dependencies: []),
        .testTarget(
            name: "CommandKitTests",
            dependencies: ["CommandKit"]),
        .target(
            name: "DocumentKit",
            dependencies: ["CommandKit"]),
        .testTarget(
            name: "DocumentKitTests",
            dependencies: ["DocumentKit"]),
    ]
)
