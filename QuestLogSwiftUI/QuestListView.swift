import SwiftUI

struct QuestListView: View {
    @EnvironmentObject var store: QuestStore
    @State private var showEditor = false
    @State private var editingIndex: Int?

    var body: some View {
        NavigationView {
            List {
                ForEach(store.quests.indices, id: .self) { index in
                    let quest = store.quests[index]
                    Section(header: header(for: quest, index: index)) {
                        ForEach(quest.steps.indices, id: .self) { stepIndex in
                            Toggle(store.quests[index].steps[stepIndex].name, isOn: stepBinding(stepIndex, index))
                        }
                        .onDelete { offsets in
                            store.quests[index].steps.remove(atOffsets: offsets)
                            store.save()
                        }
                    }
                }
                .onDelete { indices in
                    store.quests.remove(atOffsets: indices)
                    store.save()
                }
            }
            .navigationTitle("Quests")
            .toolbar {
                Button(action: { editingIndex = nil; showEditor = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showEditor) {
                QuestEditor(quest: editingIndex.map { store.quests[$0] }) { quest in
                    if let idx = editingIndex {
                        store.quests[idx] = quest
                    } else {
                        store.quests.append(quest)
                    }
                    store.save()
                }
            }
        }
    }

    private func header(for quest: Quest, index: Int) -> some View {
        HStack {
            Text(quest.title)
            Spacer()
            Button(action: { editingIndex = index; showEditor = true }) {
                Image(systemName: "pencil")
            }
            Button(action: { store.quests.remove(at: index); store.save() }) {
                Image(systemName: "trash")
            }
            Button(action: {
                for idx in store.quests.indices { store.quests[idx].active = idx == index }
                store.save()
            }) {
                Image(systemName: quest.active ? "star.fill" : "star")
            }
        }
    }

    private func stepBinding(_ stepIndex: Int, _ questIndex: Int) -> Binding<Bool> {
        Binding(
            get: { store.quests[questIndex].steps[stepIndex].completed },
            set: { val in
                store.quests[questIndex].steps[stepIndex].completed = val
                store.save()
            }
        )
    }
}
