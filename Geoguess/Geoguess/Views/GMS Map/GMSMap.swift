//
//  GMSMap.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/16/23.
//

import SwiftUI
import GoogleMaps

struct GMSStreetView: UIViewRepresentable {
    @ObservedObject var manager: GameManager
    
    func makeUIView(context: Context) -> GMSPanoramaView {
        let streetView = GMSPanoramaView(frame: CGRect.zero)
        streetView.moveNearCoordinate(CLLocationCoordinate2D(latitude: CLLocationDegrees(40.798103), longitude: CLLocationDegrees(-77.856788)))
        return streetView
    }
    
    func updateUIView(_ streetView: GMSPanoramaView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(manager: manager)
    }
}

struct GMSMap: UIViewRepresentable{
    @ObservedObject var manager: GameManager
    let marker : GMSMarker = GMSMarker()
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(40.798103), longitude: CLLocationDegrees(-77.856788), zoom: 20.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapType = .satellite
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        //        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: manager.latitude, longitude: manager.longitude))
        //        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(40.798103), longitude: CLLocationDegrees(-77.856788))
        //        marker.map = mapView
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(manager: manager)
    }
}
