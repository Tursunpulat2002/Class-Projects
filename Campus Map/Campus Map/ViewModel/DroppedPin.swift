//
//  DroppedPin.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 3/13/23.
//

import Foundation
import MapKit

class DroppedPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var placeMark : MKPlacemark
    init(coord: CLLocationCoordinate2D) {
        coordinate = coord
        placeMark = MKPlacemark(coordinate: coord)
    }
}

extension DroppedPin {
    var title : String? { self.placeMark.name ?? "" }
    var address : String { get {(self.subThoroughfare ?? "") + " " + (self.thoroughfare ?? "")} }
    var thoroughfare : String? {self.placeMark.thoroughfare}
    var subThoroughfare : String? {self.placeMark.subThoroughfare}
}
