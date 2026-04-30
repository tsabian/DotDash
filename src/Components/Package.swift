// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Components",
  platforms: [
    .iOS(.v15),
    .watchOS(.v7)
  ],
  products: [
    .library(
      name: "Components",
      targets: ["Components"]
    )
  ],
  dependencies: [
    .package(path: "../Core")
  ],
  targets: [
    .target(
      name: "Components",
      dependencies: ["Core"]
    ),
    .testTarget(
      name: "ComponentsTests",
      dependencies: ["Components"],
      path: "Tests",
      resources: [
        .process("Resources")
      ]
    )
  ]
)
