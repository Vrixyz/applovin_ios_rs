// swift-tools-version:5.5.0
import PackageDescription
let package = Package(
	name: "applovin_ios_rs",
	products: [
		.library(
			name: "applovin_ios_rs",
			targets: ["applovin_ios_rs"]),
	],
	dependencies: [],
	targets: [
		.binaryTarget(
			name: "RustXcframework",
			path: "RustXcframework.xcframework"
		),
		.target(
			name: "applovin_ios_rs",
			dependencies: ["RustXcframework"])
	]
)
	