// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "EduManagement-iOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EduManagement-iOS",
            targets: ["EduManagement-iOS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
    ],
    targets: [
        .target(
            name: "EduManagement-iOS",
            dependencies: ["Alamofire"],
            path: "CleanArchitecture"),
        .testTarget(
            name: "EduManagement-iOSTests",
            dependencies: ["EduManagement-iOS"],
            path: "CleanArchitectureTests"),
    ]
)
