import SwiftUI

@main
struct QuestLogSwiftUIApp: App {
    @StateObject private var store = QuestStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
