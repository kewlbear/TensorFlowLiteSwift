// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TensorFlowLiteSwift",
    products: [
        .library(
            name: "TensorFlowLiteSwift",
            targets: ["TensorFlowLite"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/TensorFlowLiteC.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "TensorFlowLite",
            dependencies: ["TensorFlowLiteC"]),
    ]
)
