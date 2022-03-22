// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "AppImport",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "AppImport", targets: ["AppImport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ivanvorobei/NativeUIKit", .upToNextMajor(from: "1.4.6")),
        .package(url: "https://github.com/ivanvorobei/SPIndicator", .upToNextMajor(from: "1.6.4")),
        .package(url: "https://github.com/ivanvorobei/SPPermissions", .upToNextMajor(from: "7.1.5")),
        .package(url: "https://github.com/ivanvorobei/SPAlert", .upToNextMajor(from: "4.2.0")),
        .package(url: "https://github.com/sparrowcode/SPSafeSymbols", .upToNextMajor(from: "1.0.5")),
        .package(url: "https://github.com/sparrowcode/SPSettingsIcons", .upToNextMajor(from: "1.0.1")),
        .package(url: "https://github.com/kean/Nuke", .upToNextMajor(from: "10.7.1")),
        .package(path: "Logic"),
        .package(path: "Constants"),
        .package(path: "Models"),
        .package(path: "Texts")
    ],
    targets: [
        .target(
            name: "AppImport",
            dependencies: [
                .product(name: "SPAlert", package: "SPAlert"),
                .product(name: "SPIndicator", package: "SPIndicator"),
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "Logic", package: "Logic"),
                .product(name: "Constants", package: "Constants"),
                .product(name: "NativeUIKit", package: "NativeUIKit"),
                .product(name: "SPPermissionsNotification", package: "SPPermissions"),
                .product(name: "SPSafeSymbols", package: "SPSafeSymbols"),
                .product(name: "SPSettingsIcons", package: "SPSettingsIcons"),
                .product(name: "Models", package: "Models"),
                .product(name: "Texts", package: "Texts")
            ]
        )
    ]
)
