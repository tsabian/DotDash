// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DotDashWatchOS",
  products: [
    .library(
      name: "DotDashWatchOS",
      targets: ["DotDashWatchOS"]
    ),
  ],
  dependencies: [
    .package(path: "../Core"),
    .package(path: "../Components"),
  ],
  targets: [
    .target(
      name: "DotDashWatchOS",
      dependencies: ["Core", "Components"]
    ),
    .testTarget(
      name: "DotDashWatchOSTests",
      dependencies: ["DotDashWatchOS"]
    ),
  ]
)
