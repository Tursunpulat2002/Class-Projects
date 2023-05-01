//
//  MapCoordinator.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/16/23.
//

import Foundation
import GoogleMaps

class MapCoordinator: NSObject, GMSMapViewDelegate{
    let manager: GameManager
    
    init(manager: GameManager) {
        self.manager = manager
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        let marker = GMSMarker()
        marker.position = coordinate
        marker.map = mapView
        manager.guessLocation = Location(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
