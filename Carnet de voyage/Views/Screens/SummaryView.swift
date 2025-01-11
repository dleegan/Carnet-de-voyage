//
//  SummaryView.swift
//  Carnet de voyage
//
//  Created by dleegan on 11/01/2025.
//

import MapKit
import SwiftUI

let region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    ),
    span: MKCoordinateSpan(
        latitudeDelta: 0.05,
        longitudeDelta: 0.05
    )
)

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct SummaryView: View {
    @State private var position: MapCameraPosition = .region(region)

    let mark = Landmark(
        name: "Tour Eiffel",
        coordinate: CLLocationCoordinate2D(
            latitude: 48.8588443,
            longitude: 2.2943506
        )
    )

    var body: some View {
        Map(position: $position) {
            Annotation(mark.name, coordinate: mark.coordinate) {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.orange)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .mapControls {}
    }
}

#Preview {
    SummaryView()
}
