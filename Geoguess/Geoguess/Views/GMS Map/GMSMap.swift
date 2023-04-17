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
        let streetView = GMSPanoramaView.panorama(withFrame: CGRect.zero, nearCoordinate: CLLocationCoordinate2D(latitude: manager.latitude, longitude: manager.longitude), radius: 10000)
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
        let camera = GMSCameraPosition.camera(withLatitude: manager.latitude, longitude: manager.longitude, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapType = .satellite
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(manager: manager)
    }
}
