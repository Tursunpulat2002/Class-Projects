//
//  GameModel.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/16/23.
//

import Foundation

struct Location: Codable{
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
}
