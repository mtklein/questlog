import SwiftUI
import MapKit

struct MapScreen: View {
    @EnvironmentObject var store: QuestStore

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: stepsWithCoords) { step in
                MapMarker(coordinate: step.coordinate!, tint: .blue)
            }
            .navigationTitle("Map")
            .onAppear {
                if let first = stepsWithCoords.first?.coordinate {
                    region.center = first
                }
            }
        }
    }

    private var stepsWithCoords: [QuestStep] {
        if let quest = store.quests.first(where: { $0.active }) {
            return quest.steps.filter { $0.coordinate != nil }
        }
        return []
    }
}
