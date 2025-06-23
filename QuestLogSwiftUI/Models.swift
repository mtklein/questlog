import Foundation
import MapKit

struct QuestStep: Identifiable, Codable {
    let id: UUID
    var name: String
    var completed: Bool
    var latitude: Double?
    var longitude: Double?

    var coordinate: CLLocationCoordinate2D? {
        guard let lat = latitude, let lon = longitude else { return nil }
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }

    init(id: UUID = UUID(), name: String, completed: Bool = false, latitude: Double? = nil, longitude: Double? = nil) {
        self.id = id
        self.name = name
        self.completed = completed
        self.latitude = latitude
        self.longitude = longitude
    }
}

struct Quest: Identifiable, Codable {
    let id: UUID
    var title: String
    var steps: [QuestStep]
    var active: Bool

    init(id: UUID = UUID(), title: String, steps: [QuestStep] = [], active: Bool = false) {
        self.id = id
        self.title = title
        self.steps = steps
        self.active = active
    }
}

final class QuestStore: ObservableObject {
    @Published var quests: [Quest] = []
    private let fileName = "quests.json"

    private var fileURL: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent(fileName)
    }

    init() {
        load()
    }

    func load() {
        guard let data = try? Data(contentsOf: fileURL) else {
            quests = Self.defaultQuests
            save()
            return
        }
        if let decoded = try? JSONDecoder().decode([Quest].self, from: data) {
            quests = decoded
        } else {
            quests = Self.defaultQuests
        }
    }

    func save() {
        if let data = try? JSONEncoder().encode(quests) {
            try? data.write(to: fileURL)
        }
    }

    private static var defaultQuests: [Quest] {
        [
            Quest(title: "Visit the Temple", steps: [
                QuestStep(name: "Buy tickets", latitude: 35.0, longitude: -120.0),
                QuestStep(name: "Take the train"),
                QuestStep(name: "Explore the grounds", latitude: 35.1, longitude: -120.1)
            ]),
            Quest(title: "Daily Workout", steps: [
                QuestStep(name: "Warm-up"),
                QuestStep(name: "Run 5k"),
                QuestStep(name: "Stretch")
            ])
        ]
    }
}
