// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DotDashIOS",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "DotDashIOS",
      targets: ["DotDashIOS"]
    )
  ],
  dependencies: [
    .package(path: "../Core"),
    .package(path: "../Components")
  ],
  targets: [
    .target(
      name: "DotDashIOS",
      dependencies: ["Core", "Components"]
    ),
    .testTarget(
      name: "DotDashIOSTests",
      dependencies: ["DotDashIOS"],
      path: "Tests",
      resources: [
        .process("Resources")
      ]
    )
  ]
)
