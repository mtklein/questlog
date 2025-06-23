import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QuestListView()
                .tabItem {
                    Label("Journal", systemImage: "list.bullet")
                }
            MapScreen()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(QuestStore())
    }
}
