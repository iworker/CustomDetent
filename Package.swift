// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "CustomDetent",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "CustomDetent",
            targets: ["CustomDetent"]),
    ],
    targets: [
        .target(
            name: "CustomDetent",
            dependencies: ["UISheetPresentationControllerDetent"]
        ),
        .target(name: "UISheetPresentationControllerDetent")
    ]
)
