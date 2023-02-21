//
//  Place.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import Foundation
import MapKit

class Place :  NSObject, Identifiable, MKAnnotation {
    var placeMark : MKPlacemark
    var phoneNumber : String
    var url : String
    var customName : String?
    var favorite : Bool = false
    var id  = UUID()
    
    static var standard = Place(placeMark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.7995434596538, longitude: -77.8559411783851)))
    
    init(placeMark:MKPlacemark, phoneNumber:String, url:String, customName:String?) {
        self.placeMark = placeMark
        self.phoneNumber = phoneNumber
        self.url = url
        self.customName = customName
    }

}

// Computed Properties
extension Place {
    var title : String? { self.placeMark.name ?? "" }
    var address : String { get {(self.subThoroughfare ?? "") + " " + (self.thoroughfare ?? "")} }
    var name : String {customName ?? placeMark.name ?? "No Name"}
    var thoroughfare : String? {self.placeMark.thoroughfare}
    var subThoroughfare : String? {self.placeMark.subThoroughfare}
    var coordinate : CLLocationCoordinate2D {self.placeMark.coordinate}
}

// Convenient Init
extension Place {
    convenience init(mapItem:MKMapItem) {
        self.init(placeMark:mapItem.placemark, phoneNumber:mapItem.phoneNumber ?? "", url:mapItem.url?.description ?? "", customName:"")
    }
    
    convenience init(placeMark:MKPlacemark) {
        self.init(placeMark:placeMark, phoneNumber: "", url: "", customName:"")
    }
    
    convenience init(placeMark:MKPlacemark, name:String) {
        self.init(placeMark:placeMark)
        self.customName = name
    }
}
