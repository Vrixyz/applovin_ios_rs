// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "applovin_ios_rs",
    platforms: [.iOS("15.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "applovin_ios_rs",
            targets: ["applovin_ios_rs"]),
    ],
    dependencies: [],
    targets: [.target(name: "applovin_ios_rs")]
)
