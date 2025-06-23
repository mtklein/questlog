import Foundation
import MapKit

struct QuestStep: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D?
}

struct Quest: Identifiable {
    let id = UUID()
    var title: String
    var steps: [QuestStep]
}

final class QuestStore: ObservableObject {
    @Published var quests: [Quest] = sampleQuests
}

let sampleQuests: [Quest] = [
    Quest(title: "Sample Quest", steps: [
        QuestStep(name: "Start", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        QuestStep(name: "Finish", coordinate: CLLocationCoordinate2D(latitude: 37.781, longitude: -122.411))
    ])
]
