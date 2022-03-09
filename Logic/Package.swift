// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Logic",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "Logic", targets: ["Logic"])
    ],
    dependencies: [
        .package(url: "https://github.com/ivanvorobei/SPFirebase", .upToNextMajor(from: "1.0.8")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.5.0")),
        .package(url: "https://github.com/ivanvorobei/SPProfiling", .upToNextMajor(from: "1.1.8")),
        .package(path: "Constants"),
        .package(path: "Models"),
        .package(path: "Texts")
    ],
    targets: [
        .target(
            name: "Logic",
            dependencies: [
                .product(name: "SPProfiling", package: "SPProfiling"),
                .product(name: "SPFirebaseAuth", package: "SPFirebase"),
                .product(name: "SPFirebaseFirestore", package: "SPFirebase"),
                .product(name: "SPFirebaseMessaging", package: "SPFirebase"),
                .product(name: "SPFirebaseStorage", package: "SPFirebase"),
                .product(name: "SwiftyJSON", package: "SwiftyJSON"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Constants", package: "Constants"),
                .product(name: "Models", package: "Models"),
                .product(name: "Texts", package: "Texts")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
