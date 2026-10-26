// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "bdk-swift",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BitcoinDevKit",
            targets: ["bdkFFI", "BitcoinDevKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "bdkFFI",
            url: "https://github.com/Birch-Wallet/bdk-swift/releases/download/3.1.1-populate-cache/bdkFFI.xcframework.zip",
            checksum: "14aaafe88124fb2d4d9e0d82651e18b72709210746dc38506bc5fd77b52e05dc"),
        .target(
            name: "BitcoinDevKit",
            dependencies: ["bdkFFI"]),
        .testTarget(
            name: "BitcoinDevKitTests",
            dependencies: ["BitcoinDevKit"]),
    ]
)
