//
//  Building.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import Foundation

struct Building : Codable, Identifiable {
    var latitude: Double
    var longitude: Double
    var name : String
    var opp_bldg_code : Int
    var year_constructed : Int
    var id : String {name}
    
    static var buildings = {
        var buildings : [Building] = []
        let buildingURL = Bundle.main.url(forResource: "Buildings", withExtension: "json")!
        do {
            let data = try Data(contentsOf: buildingURL)
            let decoder = JSONDecoder()
            buildings = try decoder.decode([Building].self, from: data)
        } catch   {
            print("Error decoding Restaurants: \(error)")
            buildings = []
        }
        return buildings
    }()
}
