// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Texts",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Texts",
            targets: ["Texts"]
        )
    ],
    dependencies: [
        .package(path: "Models")
    ],
    targets: [
        .target(
            name: "Texts",
            dependencies: [
                .product(name: "Models", package: "Models")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
