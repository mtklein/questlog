// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "QuestLog",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .executable(name: "QuestLog", targets: ["QuestLog"])
    ],
    targets: [
        .executableTarget(
            name: "QuestLog",
            path: "QuestLog"
        )
    ]
)
