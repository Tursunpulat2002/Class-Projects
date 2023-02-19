//
//  Spot.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import Foundation

struct Spot : Identifiable {
    let coord : Coord
    let title : String?
    let subtitle : String?
    var id = UUID()
    
    init(coord:Coord, title:String? = nil, subtitle:String? = nil) {
        self.coord = coord
        self.title = title
        self.subtitle = subtitle
    }
}
