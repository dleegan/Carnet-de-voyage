//
//  MemoriesView.swift
//  Carnet de voyage
//
//  Created by dleegan on 11/01/2025.
//

import SwiftUI

struct MemoriesView: View {
    @StateObject var memories: MemoryCollection = myMemories
    @State var showModal: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(memories.memories) { memory in
                        NavigationLink(destination: {
                            Text("Testt")
                        }, label: {
                            MemoryPreviewCell(memory: memory)
                                .foregroundStyle(.black)
                        })
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("New Memory", systemImage: "photo.badge.plus.fill") {
                        showModal = true
                    }
                }
            }
            .sheet(isPresented: $showModal, content: {
                NewMemoryView()
            })
            .navigationTitle("San Francisco")
        }
    }
}

#Preview {
    MemoriesView()
}
