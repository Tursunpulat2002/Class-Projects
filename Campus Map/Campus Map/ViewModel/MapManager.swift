//
//  MapManager.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import Foundation
import MapKit
import SwiftUI

class MapManager: NSObject, ObservableObject{
    @Published var locationModel : LocationModel

    @Published var region : MKCoordinateRegion
    
    
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
    
    let locationManager : CLLocationManager
    var userRecentLocation : CLLocation?
    @Published var isEQ : Bool = false
    
    @Published var isFavorited: [Bool]
    @Published var showRouteSheet = false
    @Published var route : MKRoute?
    @Published var ETA : String = ""
    @Published var heading : Double = 0.0
    
    
    override init(){
        let _locationModel = LocationModel()
        region = MKCoordinateRegion(center: _locationModel.centerCoord.coordCL2D, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        locationModel = _locationModel
        let size = Building.buildings.count
        var _isSelected: [Bool] = []
        for _ in 0..<size {
            _isSelected.append(false)
        }
        isSelected = _isSelected
        isFavorited = _isSelected
        
        locationManager = CLLocationManager()
        super.init()
                
        locationManager.delegate = self
        locationManager.desiredAccuracy = .leastNonzeroMagnitude
        
    }
    
    func toggleFavorite(place: Place) {
        guard let index = places.firstIndex(of: place) else { return }
        self.places[index].favorite.toggle()
        isFavorited[index].toggle()
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
    
    func isNearby()->[Building]{
        var builds: [Building] = []
        for building in Building.buildings{
            if(300 < userRecentLocation!.distance(from: CLLocation(latitude: building.latitude, longitude: building.longitude))){
                builds.append(building)
            }
        }
        return builds
    }
    
    func center(){
        region.center = userRecentLocation!.coordinate
        isEQ = true
    }
    
    func isEquals(){
        if(region.center.latitude != userRecentLocation!.coordinate.latitude && region.center.longitude != userRecentLocation!.coordinate.longitude){
            isEQ = false
        }
    }
    
    func showAll(){
        var maxLong = -77.841584
        var minLong = -77.868449
        var maxLat = 40.816537
        var minLat = 40.792953
        
        for i in 0..<places.count{
            if(isSelected[i]){
                if(maxLat < places[i].coordinate.latitude){
                    maxLat = places[i].coordinate.latitude
                } else if (minLat > places[i].coordinate.latitude){
                    minLat = places[i].coordinate.latitude
                }
                if (maxLong < places[i].coordinate.longitude){
                    maxLong = places[i].coordinate.longitude
                } else if (minLong > places[i].coordinate.longitude){
                    minLong = places[i].coordinate.longitude
                }
            }
        }
        let deltaLat = (maxLat-minLat)*2
        let deltaLong = (maxLong-minLong)*2
        if(deltaLat>0 && deltaLong>0){
            region.span.latitudeDelta = deltaLat
            region.span.longitudeDelta = deltaLong
        }else{
            region.span.latitudeDelta = 0.05
            region.span.longitudeDelta = 0.05
        }
        
        region.center.longitude = maxLong-(0.5*(maxLong-minLong))
        region.center.latitude = maxLat-(0.5*(maxLat-minLat))
    }
    
//    func getBearing(){
//        let x = cos(self.selectedPlace!.coordinate.latitude)*sin((self.selectedPlace!.coordinate.longitude)-self.userRecentLocation!.coordinate.longitude)
//        let y = cos(self.userRecentLocation!.coordinate.latitude)*sin(self.selectedPlace!.coordinate.latitude)-sin(self.userRecentLocation!.coordinate.latitude)*cos(self.selectedPlace!.coordinate.latitude)*cos((self.selectedPlace!.coordinate.longitude)-self.userRecentLocation!.coordinate.longitude)
//
//        let b = atan2(x, y) * (180/Double.pi)
//        self.heading = b
//    }
    
    func degreesToRadians(degrees: Double) -> Double { return degrees * .pi / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / .pi }

    func getBearingBetweenTwoPoints1(){

        let point1 = userRecentLocation
        let point2 = selectedPlace
        
        let lat1 = degreesToRadians(degrees: point1!.coordinate.latitude)
        let lon1 = degreesToRadians(degrees: point1!.coordinate.longitude)

        let lat2 = degreesToRadians(degrees: point2!.coordinate.latitude)
        let lon2 = degreesToRadians(degrees: point2!.coordinate.longitude)

        let dLon = lon2 - lon1

        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)

        heading = radiansToDegrees(radians: radiansBearing)
    }
    
    func provideRoute() {
        let request = MKDirections.Request()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem(placemark: selectedPlace!.placeMark)
        request.transportType = .walking
        request.requestsAlternateRoutes = true
            
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard error == nil else {return}
                
            if let route = response?.routes.first {
                self.route = route
                let formatter = DateComponentsFormatter()
                formatter.unitsStyle = .full
                formatter.includesApproximationPhrase = true
                formatter.allowedUnits = [.minute, .second]
                let eta = route.expectedTravelTime
                self.ETA = formatter.string(from: eta)!
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
