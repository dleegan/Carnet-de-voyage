//
//  Memory.swift
//  Carnet de voyage
//
//  Created by dleegan on 09/01/2025.
//

import Foundation
import MapKit
import SwiftUI

class Memory: Identifiable, ObservableObject {
    let id = UUID()
    let title: String
    let image: Image?
    let description: String
    let localisation: CLLocationCoordinate2D
//    @Published var note: Int
//    @Published var text: String

    init(title: String, description: String, localisation: CLLocationCoordinate2D) {
        self.title = title
        self.image = nil
        self.description = description
        self.localisation = localisation
    }
}
