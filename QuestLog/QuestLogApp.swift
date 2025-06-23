import SwiftUI

@main
struct QuestLogApp: App {
    @StateObject private var store = QuestStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
