// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "t21_rxadditions_ios",
    products: [
        .library(
            name: "t21_rxadditions_ios",
            targets: ["t21_rxadditions_ios"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "t21_rxadditions_ios",
            dependencies: ["RxSwift", "RxCocoa"],
            path: "./src"),
    ]
)
