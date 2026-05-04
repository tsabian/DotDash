// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DotDashWatchOS",
  platforms: [
    .iOS(.v15),
    .watchOS(.v7)
  ],
  products: [
    .library(
      name: "DotDashWatchOS",
      targets: ["DotDashWatchOS"]
    )
  ],
  dependencies: [
    .package(path: "../Core"),
    .package(path: "../Components")
  ],
  targets: [
    .target(
      name: "DotDashWatchOS",
      dependencies: ["Core", "Components"]
    ),
    .testTarget(
      name: "DotDashWatchOSTests",
      dependencies: ["DotDashWatchOS"],
      path: "Tests/WatchOSTests",
      resources: [
        .process("Resources")
      ]
    ),
    .testTarget(
      name: "DotDashWatchOSUITests",
      dependencies: ["DotDashWatchOS"],
      path: "Tests/WatchOSUITests",
      resources: [
        .process("Resources")
      ]
    )
  ]
)
