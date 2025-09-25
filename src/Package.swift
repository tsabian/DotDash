// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift tools required to build this package.

import PackageDescription

let package = Package(
    name: "DotDash",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "DotDash",
            targets: ["DotDash"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "12.3.0")
    ],
    targets: [
        .target(
            name: "DotDash",
            dependencies: [
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
            ],
            path: "src/DotDash/Sources",
            resources: [
                .process("../Resources/Assets.xcassets")
            ]
        ),
        .testTarget(
            name: "DotDashTests",
            dependencies: ["DotDash"],
            path: "src/DotDashTests/Sources"
        ),
        .testTarget(
            name: "DotDashUITests",
            dependencies: ["DotDash"],
            path: "src/DotDashUITests/Sources"
        ),
    ]
)