// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "T21RxAdditions",
    products: [
        .library(
            name: "T21RxAdditions",
            targets: ["T21RxAdditions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.1")
    ],
    targets: [
        .target(
            name: "T21RxAdditions",
            dependencies: ["RxSwift,RxCocoa"],
            path: "./src"),
    ]
)
