// swift-tools-version:5.8
import PackageDescription
// change to 5.8

let package = Package(
    name: "trackYourReadAPI",
    platforms: [
       .macOS(.v12) //change to v13
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.1"),
		.package(url: "https://github.com/vapor/leaf.git", from: "4.2.4"),
		.package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
		.package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.4.0")
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
				.product(name: "Fluent", package: "fluent"),
				.product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
                .product(name: "Vapor", package: "vapor"),
				.product(name: "Leaf", package: "leaf")
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
