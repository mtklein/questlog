import SwiftUI
import MapKit

struct MapScreen: View {
    @EnvironmentObject var store: QuestStore

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: stepsWithCoords) { step in
                MapMarker(coordinate: step.coordinate!, tint: .blue)
            }
            .navigationTitle("Map")
        }
    }

    private var stepsWithCoords: [QuestStep] {
        store.quests.flatMap { $0.steps }.filter { $0.coordinate != nil }
    }
}
