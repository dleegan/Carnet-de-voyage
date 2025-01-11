//
//  LocationManager.swift
//  Carnet de voyage
//
//  Created by dleegan on 11/01/2025.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // MARK: Private properties

    private let locationManager = CLLocationManager()

    // MARK: Published properties

    @Published var userLocation: CLLocationCoordinate2D?

    // MARK: Initializers

    override init() {
        super.init()
        locationManager.delegate = self // Définir cette classe comme déléguée
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // Précision maximale
        locationManager.requestWhenInUseAuthorization() // Demander la permission
        locationManager.startUpdatingLocation() // Commencer à mettre à jour la localisation
    }

    // MARK: CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        userLocation = latestLocation.coordinate // Stocker la nouvelle position
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.startUpdatingLocation() // Démarrer la mise à jour si autorisé
            case .denied, .restricted:
                // Gérer le cas où l'autorisation est refusée
                print("Autorisation refusée")
            case .notDetermined:
                // Encore en attente d'autorisation
                break
            default:
                break
        }
    }
}
