//
//  LocationManagerDelegate.swift
//  Weather
//
//  Created by Sandeep Reddy on 2023-07-31.
//

import Foundation
import CoreLocation
import Combine

class LocationManagerDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        $userLocation
            .sink { [weak self] location in
                guard let location = location else { return }
              
            }
            .store(in: &cancellables)
    }

    func startUpdatingLocation() {
           locationManager.startUpdatingLocation()
       }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        userLocation = location.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
}
