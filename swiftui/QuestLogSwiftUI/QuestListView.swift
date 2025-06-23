import SwiftUI

struct QuestListView: View {
    @EnvironmentObject var store: QuestStore

    var body: some View {
        NavigationView {
            List {
                ForEach(store.quests) { quest in
                    Section(header: Text(quest.title)) {
                        ForEach(quest.steps) { step in
                            Text(step.name)
                        }
                    }
                }
            }
            .navigationTitle("Quests")
        }
    }
}
