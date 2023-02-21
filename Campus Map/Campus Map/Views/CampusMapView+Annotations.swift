//
//  CampusMapView+Annotations.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import SwiftUI
import MapKit
import Foundation

extension CampusMapView {
    
    func markerFor(spot : Spot) -> some MapAnnotationProtocol {
        MapMarker(coordinate: spot.coordinate, tint: .red)
    }
    func annotationFor2(spot: Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Button {
                selectedSpot = spot
                manager.showConfirmation = true
            } label: {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 40))
            }

        }
    }
    func menuFor(spot: Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)
                .contextMenu {
                    Text(spot.title!)
                    Button {
                        selectedSpot = spot
                        manager.showSheet = true
                    } label: {
                        Text("Details")
                    }
                }
        }
    }
    
    func annotationFor(place: Place) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: place.coordinate) {
            let index = manager.places.firstIndex(of: place)
            if(manager.isSelected[index!]){
                Button(action: {
                    manager.selectedPlace = place
                    manager.showConfirmation = true
                }) {
                    Image(systemName: "mappin").renderingMode(.template)
                        .foregroundColor(place.favorite ? .red : .blue)
                        .font(.system(size: 40))
                }
            }
        }
    }
}
