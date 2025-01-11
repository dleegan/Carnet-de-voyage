//
//  ContentView.swift
//  Carnet de voyage
//
//  Created by dleegan on 09/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("My Memories", systemImage: "list.bullet.circle.fill") {
                MemoriesView()
            }

            Tab("Summary", systemImage: "map.fill") {
                SummaryView()
            }
        }
    }
}

#Preview {
    ContentView()
}
