//
//  GameManager.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/15/23.
//

import Foundation
import GoogleMaps
import CoreLocation

class GameManager  : NSObject, ObservableObject {
    let locationManager = CLLocationManager()
    
    var storageManager: StorageManager<[Game]>
    @Published var games: [Game]
    @Published var game: Game?
    @Published var round: Int?
    
    @Published var isGuess: Bool = false
    
    @Published var location: CLLocation?{
        willSet { objectWillChange.send() }
    }
    
    var latitude: CLLocationDegrees
    {
        return location?.coordinate.latitude ?? 0
    }
    
    var longitude: CLLocationDegrees
    {
        return location?.coordinate.longitude ?? 0
    }
    
    override init() {
        let filename = "GeoGuess"
        storageManager = StorageManager<[Game]>(filename: filename)
        games = storageManager.modelData ?? []
        
        super.init()
        location = CLLocation(latitude: CLLocationDegrees(randomBetweenNumbers(firstNum: 25.3, secondNum: 49.0)), longitude: CLLocationDegrees(randomBetweenNumbers(firstNum: -124.7, secondNum: -64.2)))
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func generateNewLocation(){
        location = CLLocation(latitude: CLLocationDegrees(randomBetweenNumbers(firstNum: 25.3, secondNum: 49.0)), longitude: CLLocationDegrees(randomBetweenNumbers(firstNum: -124.7, secondNum: -64.2)))
    }
}

extension GameManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}
