// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Demo",
    products: [
        .library(
            name: "Demo",
            targets: ["Demo"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Demo",
            dependencies: []),
        .testTarget(
            name: "DemoTests",
            dependencies: ["Demo"]),
    ]
)