// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "combine-schedulers",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_13),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "CombineSchedulers",
      targets: ["CombineSchedulers"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/oskarirauta/swift-concurrency-extras", from: "1.0.1"),
    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.2.2"),
  ],
  targets: [
    .target(
      name: "CombineSchedulers",
      dependencies: [
        .product(name: "ConcurrencyExtras", package: "swift-concurrency-extras"),
        .product(name: "IssueReporting", package: "xctest-dynamic-overlay"),
      ]
    ),
    .testTarget(
      name: "CombineSchedulersTests",
      dependencies: [
        "CombineSchedulers"
      ]
    ),
  ]
)

for target in package.targets {
  target.swiftSettings = target.swiftSettings ?? []
  target.swiftSettings!.append(contentsOf: [
    .enableExperimentalFeature("StrictConcurrency")
  ])
}
