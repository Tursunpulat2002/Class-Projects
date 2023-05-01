//
//  GameModel.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/16/23.
//

import Foundation

struct Location: Codable, Hashable{
    let latitude: Double
    let longitude: Double
}

struct Game: Identifiable, Codable{
    var id = UUID()
    var playerNumber: Int
    var gameType: String
    var scoresPerRound: [Int]
    var locationPerRound: [Location]
    var totalScore: Int
    
    static var standard = Game(playerNumber: 1, gameType: "Solo", scoresPerRound: [100, 100, 100, 100, 100], locationPerRound: [Location(latitude: 20, longitude: 20), Location(latitude: 20, longitude: 20), Location(latitude: 20, longitude: 20), Location(latitude: 20, longitude: 20), Location(latitude: 20, longitude: 20)], totalScore: 500)
}
