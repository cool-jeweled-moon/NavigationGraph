// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigationGraph",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "NavigationGraph",
            targets: ["NavigationGraph"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "NavigationGraph"),
//        .testTarget(
//            name: "NavigationGraphTests",
//            dependencies: ["NavigationGraph"]),
    ]
)
