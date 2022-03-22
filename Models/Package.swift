// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Models",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Models", targets: ["Models"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ivanvorobei/SparrowKit", .upToNextMajor(from: "3.6.1"))
    ],
    targets: [
        .target(
            name: "Models",
            dependencies: [
                .product(name: "SparrowKit", package: "SparrowKit")
            ]
        )
    ]
)
