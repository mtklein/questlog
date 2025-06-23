// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "QuestLogSwiftUI",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .executable(name: "QuestLogSwiftUI", targets: ["QuestLogSwiftUI"])
    ],
    targets: [
        .executableTarget(
            name: "QuestLogSwiftUI",
            path: "QuestLogSwiftUI"
        )
    ]
)
