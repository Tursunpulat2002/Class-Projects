//
//  LocationModel.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import Foundation

struct Coord {
    var latitude : Double
    var longitude : Double
}

struct LocationModel {
    let centerCoord = Coord(latitude: 40.798766, longitude: -77.863475)
    let favorites : [Spot] =
        [Spot(coord: Coord(latitude: 40.7995434596538, longitude: -77.8559411783851), title: "Redifer Commons") ,
         Spot(coord: Coord(latitude: 40.808615773028, longitude: -77.8555409099202), title: "Bryce Jordan Center")]
    
}
