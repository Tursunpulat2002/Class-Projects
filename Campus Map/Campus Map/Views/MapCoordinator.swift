//
//  MapCoordinator.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 3/13/23.
//

import Foundation
import MapKit

class MapCoordinator : NSObject, MKMapViewDelegate {
    let manager : MapManager
    
    init(manager: MapManager) {
        self.manager = manager
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        switch annotation {
            case is MKUserLocation:
                return nil
            case is Place:
                let place = annotation as! Place
                let marker = MKAnnotationView(annotation: annotation, reuseIdentifier: "")
                if(place.favorite){
                    marker.image = UIImage(systemName: "suit.heart.fill")
                }else{
                    marker.image = UIImage(systemName: "mappin")
                }
                marker.canShowCallout = true
                marker.leftCalloutAccessoryView = UIButton(type: .detailDisclosure)
                return marker
            case is DroppedPin:
//                let pin = annotation as! DroppedPin
                let marker2 = MKAnnotationView(annotation: annotation, reuseIdentifier: "")
                marker2.image = UIImage(systemName: "pin.fil")
                marker2.canShowCallout = true
                marker2.leftCalloutAccessoryView = UIButton(type: .detailDisclosure)
                return marker2
//                return nil
            default:
                return nil
            }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // assume view's annotation is a place
        let place = view.annotation as! Place
        manager.showConfirmation = true
        manager.selectedPlace = place
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polyline = overlay as! MKPolyline
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 8
        return renderer
    }
    
    @objc func addPin(recognizer: UILongPressGestureRecognizer) {
        guard recognizer.state == .began else {return}
        
        let view = recognizer.view as! MKMapView
        let point = recognizer.location(in: view)
        let coordinate = view.convert(point, toCoordinateFrom: view)
        
        let pin = DroppedPin(coord: coordinate)
        view.addAnnotation(pin)
    }
}
