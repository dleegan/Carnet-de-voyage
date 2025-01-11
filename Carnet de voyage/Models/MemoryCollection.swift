//
//  MemoryCollection.swift
//  Carnet de voyage
//
//  Created by dleegan on 11/01/2025.
//

import Foundation
import MapKit

class MemoryCollection: ObservableObject {
    @Published var memories: [Memory]

    init(memories: [Memory]) {
        self.memories = memories
    }
}

let myMemories = MemoryCollection(memories: [
    Memory(title: "Test1", description: "Descccccc", localisation: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    )),
    Memory(title: "Test2", description: "Descccccc", localisation: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    )),
    Memory(title: "Test3", description: "Descccccc", localisation: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    )),
    Memory(title: "Test4", description: "Descccccc", localisation: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    )),
    Memory(title: "Test5", description: "Descccccc", localisation: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    )),
    Memory(title: "Test6", description: "Descccccc", localisation: CLLocationCoordinate2D(
        latitude: 48.8588443,
        longitude: 2.2943506
    ))
])
