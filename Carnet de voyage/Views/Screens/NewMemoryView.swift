//
//  NewMemoryView.swift
//  Carnet de voyage
//
//  Created by dleegan on 11/01/2025.
//

import MapKit
import PhotosUI
import SwiftUI

struct NewMemoryView: View {
    @StateObject private var locationManager = LocationManager()

    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?

    @State private var showCamera: Bool = false
    @State private var isShowing: Bool = false

    @State private var title: String = ""
    @State private var description: String = ""

    @State private var localisation: CLLocationCoordinate2D = .init(
        latitude: 48.8588443,
        longitude: 2.2943506
    )

    var body: some View {
        VStack {
            if let selectedImage {
                selectedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Button(action: {
                    isShowing.toggle()
                }, label: {
                    Text("$isShowing")
                })
            }

            PhotosPicker("Importer une image", selection: $pickerItem)

            Button {
                showCamera.toggle()
            } label: {
                Text("prendre une photo")
            }

            TextEditor(text: $description)
                .padding(5)
                .frame(height: 150)
                .textEditorStyle(.plain)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(lineWidth: 1)
                        .stroke(.placeholder.opacity(0.1))
                }

            if let userLocation = locationManager.userLocation {
                Map(
                    position: .constant(
                        MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: userLocation,
                                span: MKCoordinateSpan(
                                    latitudeDelta: 0.01,
                                    longitudeDelta: 0.01
                                )
                            )
                        )
                    )
                ) {
                    Annotation("", coordinate: localisation) {
                        Text("📍")
                    }
                }
                .onMapCameraChange(frequency: .continuous) { context in
                    localisation = context.region.center
                }
                .frame(height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Text("En attente de localisation...")
            }

            Button {
                showCamera.toggle()
            } label: {
                VStack {
                    Text("Valider")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
        .padding()
        .confirmationDialog("Comment souhaitez-vous ajouter une photo", isPresented: $isShowing, titleVisibility: .visible) {
            Button {
                showCamera.toggle()
            } label: {
                Text("Prendre une photo")
            }
            PhotosPicker("Importer de la bibliothèque", selection: $pickerItem)
            Button("Annuler", role: .cancel) {}
        }
        .sheet(isPresented: $showCamera, content: {
            CameraView { pickedImage in
                if let uiImage = pickedImage {
                    selectedImage = Image(uiImage: uiImage)
                }
                showCamera = false
            }
        })
        .onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
        .navigationTitle("Nouveau Memory")
    }
}

#Preview {
    NewMemoryView()
}
