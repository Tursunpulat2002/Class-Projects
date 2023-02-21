//
//  MapManager.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import Foundation
import MapKit
import SwiftUI

class MapManager: ObservableObject{
    @Published var locationModel : LocationModel

    @Published var region : MKCoordinateRegion
    let span = 0.01
    
    @Published var selectedBuilding : Building? {
        didSet {
            if let selectedBuilding = selectedBuilding {
                performSearch(on: selectedBuilding)
            }
        }
    }
    
    @Published var selectedPlace : Place?
    
    @Published var showConfirmation = false
    @Published var showSheet = false
    
    @Published var places = [Place]()
    @Published var isSelected : [Bool]
    
    init(){
        let _locationModel = LocationModel()
        region = MKCoordinateRegion(center: _locationModel.centerCoord.coordCL2D, span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
        locationModel = _locationModel
        let size = Building.buildings.count
        var _isSelected: [Bool] = []
        for _ in 0..<size {
            _isSelected.append(false)
        }
        isSelected = _isSelected
    }
    
    func toggleFavorite(place: Place) {
        guard let index = places.firstIndex(of: place) else { return }
        self.places[index].favorite.toggle()
    }
    
    func performSearch(on building: Building?) {
        guard let building = building else { return }
        let request = MKLocalSearch.Request()
        request.region = region
        request.naturalLanguageQuery = building.name
        let search = MKLocalSearch(request: request)
        search.start { resp, error in
            guard error == nil else { return }
            let mapItems = resp!.mapItems
            for item in mapItems {
                let place = Place(mapItem: item)
                self.places.append(place)
            }
        }
    }
}

extension Spot  {
    var coordinate : CLLocationCoordinate2D {
        self.coord.coordCL2D
    }
}

extension Coord {
    var coordCL2D : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
