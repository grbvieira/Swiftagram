// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Swiftagram",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "Swiftagram", targets: ["Swiftagram"]),
        .library(name: "SwiftagramCrypto", targets: ["SwiftagramCrypto"])
    ],
    dependencies: [
        .package(url: "https://github.com/sbertix/ComposableRequest", .upToNextMinor(from: "7.0.0")),
        .package(url: "https://github.com/sbertix/SwCrypt.git", .upToNextMinor(from: "5.1.0"))
    ],
    targets: [
        .target(
            name: "Swiftagram",
            dependencies: [
                .product(name: "Requests", package: "ComposableRequest"),
                .product(name: "Storages", package: "ComposableRequest")
            ]
        ),
        .target(
            name: "SwiftagramCrypto",
            dependencies: [
                "Swiftagram",
                .product(name: "EncryptedStorages", package: "ComposableRequest"),
                .product(name: "SwCrypt", package: "SwCrypt")
            ]
        ),
        .testTarget(
            name: "SwiftagramTests",
            dependencies: ["Swiftagram", "SwiftagramCrypto"]
        )
    ]
)
