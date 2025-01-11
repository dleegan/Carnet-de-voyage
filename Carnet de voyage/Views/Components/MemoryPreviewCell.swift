//
//  MemoryPreviewCell.swift
//  Carnet de voyage
//
//  Created by dleegan on 09/01/2025.
//

import MapKit
import SwiftUI

let cellRegion = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    ),
    span: MKCoordinateSpan(
        latitudeDelta: 0.005,
        longitudeDelta: 0.005
    )
)

struct MemoryPreviewCell: View {
    let memory: Memory

    @State private var position: MapCameraPosition = .region(cellRegion)

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 250)
                .overlay {
                    ZStack {
                        Map(position: $position) {
                            Annotation("", coordinate: memory.localisation) {
                                Text("📍")
                            }
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10)
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(10)
                }

            VStack(alignment: .leading) {
                Text(memory.title)
                    .bold()
                    .font(.title2)
                Text(memory.description)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
        .padding()
    }
}

#Preview {
    MemoryPreviewCell(
        memory: myMemories.memories[0]
    )
}
