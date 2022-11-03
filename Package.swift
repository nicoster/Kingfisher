// swift-tools-version:5.4

import PackageDescription

let package = Package(
  name: "MarkdownUI",
  platforms: [
    .macOS(.v11),
    .iOS(.v14),
    .tvOS(.v14),
  ],
  products: [
    .library(
      name: "MarkdownUI",
      targets: ["MarkdownUI"]
    )
  ],
  dependencies: [
    .package(
      name: "Kingfisher",
      url: "https://github.com/onevcat/Kingfisher",
      from: "7.4.0"
    ),
    .package(
      name: "SwiftCommonMark",
      url: "https://github.com/gonzalezreal/SwiftCommonMark",
      from: "1.0.0"
    ),
    .package(
      name: "AttributedText",
      url: "https://github.com/gonzalezreal/AttributedText",
      from: "1.0.1"
    ),
    .package(url: "https://github.com/pointfreeco/combine-schedulers", from: "0.5.3"),
    .package(
      name: "SnapshotTesting",
      url: "https://github.com/pointfreeco/swift-snapshot-testing",
      from: "1.10.0"
    ),
  ],
  targets: [
    .target(
      name: "MarkdownUI",
      dependencies: [
        .product(name: "CommonMark", package: "SwiftCommonMark"),
        "AttributedText",
        "Kingfisher",
        .product(name: "CombineSchedulers", package: "combine-schedulers"),
      ]
    ),
    .testTarget(
      name: "MarkdownUITests",
      dependencies: [
        "MarkdownUI",
        "SnapshotTesting",
      ],
      exclude: ["__Snapshots__"]
    ),
  ]
)
