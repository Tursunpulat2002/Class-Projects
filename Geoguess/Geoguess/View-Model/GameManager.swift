//
//  GameManager.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/15/23.
//

import Foundation
import GoogleMaps

class GameManager  : NSObject, ObservableObject {
    let locationManager = CLLocationManager()
    
    @Published var isGuess: Bool = false
    
    @Published var location: CLLocation? {
      willSet { objectWillChange.send() }
    }
   
   var latitude: CLLocationDegrees {
       return location?.coordinate.latitude ?? 0
   }
   
   var longitude: CLLocationDegrees {
       return location?.coordinate.longitude ?? 0
   }
    
    override init() {
        super.init()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension GameManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}
