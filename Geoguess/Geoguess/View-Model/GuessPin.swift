//
//  GuessPin.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/30/23.
//

import Foundation
import GoogleMaps

class GuessPin: NSObject{
    var coordinate: CLLocationCoordinate2D
    init(coord: CLLocationCoordinate2D) {
        coordinate = coord
    }
}
