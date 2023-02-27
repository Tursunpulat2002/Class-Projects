//
//  MapManager+Location.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/24/23.
//

import Foundation
import CoreLocation

extension MapManager : CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let firstLocation = locations[0]
        userRecentLocation = firstLocation
        
    }
    
}
