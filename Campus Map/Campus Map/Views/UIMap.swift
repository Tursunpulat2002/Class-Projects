//
//  UIMap.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 3/13/23.
//

import SwiftUI
import MapKit

struct UIMap: UIViewRepresentable {
    @ObservedObject var manager : MapManager
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        mapView.setRegion(manager.region, animated: true)
        mapView.delegate = context.coordinator
        
        let longPress = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.addPin))
        mapView.addGestureRecognizer(longPress)
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)
        mapView.addAnnotations(manager.places)
        
        switch manager.mapType{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .standard
        }
        if (manager.trackType){
            mapView.userTrackingMode = .follow
        }else{
            mapView.userTrackingMode = .none
        }
        
        mapView.removeOverlays(mapView.overlays)
        if let lineOverlay = manager.routeLines {
            mapView.addOverlay(lineOverlay)
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(manager: manager)
    }
    
}

