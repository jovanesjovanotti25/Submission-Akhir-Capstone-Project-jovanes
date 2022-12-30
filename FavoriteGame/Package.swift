// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoriteGame",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FavoriteGame",
            targets: ["FavoriteGame"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/realm/realm-cocoa.git", from: "5.4.4"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "5.15.8"),
        .package(path: "../Game"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FavoriteGame",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-cocoa"),
                "Kingfisher",
                "RxSwift",
                "Alamofire",
                "Game"]),
        .testTarget(
            name: "FavoriteGameTests",
            dependencies: ["FavoriteGame"]),
    ]
)
