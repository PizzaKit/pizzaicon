// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "PizzaIcon",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15), 
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "PizzaIcon",
            targets: ["PizzaIcon"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/SnapKit/SnapKit",
            from: "5.7.1"
        ),
        .package(
            url: "https://github.com/SFSafeSymbols/SFSafeSymbols",
            from: "6.2.0"
        )
    ],
    targets: [
        .target(
            name: "PizzaIcon",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
