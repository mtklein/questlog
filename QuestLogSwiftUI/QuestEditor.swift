import SwiftUI

struct QuestEditor: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String
    @State private var steps: [QuestStep]
    let questId: UUID?
    let onSave: (Quest) -> Void

    init(quest: Quest?, onSave: @escaping (Quest) -> Void) {
        _title = State(initialValue: quest?.title ?? "")
        _steps = State(initialValue: quest?.steps ?? [])
        self.questId = quest?.id
        self.onSave = onSave
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Quest Title", text: $title)
                Section(header: Text("Steps")) {
                    ForEach($steps) { $step in
                        TextField("Step", text: $step.name)
                    }
                    .onDelete { steps.remove(atOffsets: $0) }
                    Button("Add Step") {
                        steps.append(QuestStep(name: ""))
                    }
                }
            }
            .navigationTitle(questId == nil ? "New Quest" : "Edit Quest")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: { dismiss() })
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let q = Quest(id: questId ?? UUID(), title: title, steps: steps)
                        onSave(q)
                        dismiss()
                    }
                }
            }
        }
    }
}
