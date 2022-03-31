// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Components",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "AppImport",
            targets: ["AppImport"]
        ),
        .library(
            name: "Logic",
            targets: ["Logic"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ivanvorobei/SPFirebase", .upToNextMajor(from: "1.0.9")),
        .package(url: "https://github.com/ivanvorobei/SparrowKit", .upToNextMajor(from: "3.6.1")),
        .package(url: "https://github.com/ivanvorobei/NativeUIKit", .upToNextMajor(from: "1.4.6")),
        .package(url: "https://github.com/ivanvorobei/SPIndicator", .upToNextMajor(from: "1.6.4")),
        .package(url: "https://github.com/ivanvorobei/SPPermissions", .upToNextMajor(from: "7.1.5")),
        .package(url: "https://github.com/ivanvorobei/SPAlert", .upToNextMajor(from: "4.2.0")),
        .package(url: "https://github.com/sparrowcode/SPSafeSymbols", .upToNextMajor(from: "1.0.5")),
        .package(url: "https://github.com/sparrowcode/SPSettingsIcons", .upToNextMajor(from: "1.0.1")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.5.0")),
        .package(url: "https://github.com/kean/Nuke", .upToNextMajor(from: "10.7.1")),
    ],
    targets: [
        .target(
            name: "AppImport",
            dependencies: [
                "NativeUIKit", "SPIndicator", "SPAlert", "SPSafeSymbols", "SPSettingsIcons", "Nuke", "Logic",
                .product(name: "SPPermissionsNotification", package: "SPPermissions")
            ]
        ),
        .target(
            name: "ExtensionImport",
            dependencies: []
        ),
        .target(
            name: "Logic",
            dependencies: [
                "SwiftyJSON", "Alamofire", "Constants", "Models", "Texts",
                .product(name: "SPFirebaseAuth", package: "SPFirebase"),
                .product(name: "SPFirebaseFirestore", package: "SPFirebase"),
                .product(name: "SPFirebaseMessaging", package: "SPFirebase"),
                .product(name: "SPFirebaseStorage", package: "SPFirebase")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "Constants",
            dependencies: []
        ),
        .target(
            name: "Models",
            dependencies: ["SparrowKit"]
        ),
        .target(
            name: "Texts",
            dependencies: [],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
