//
//  Pokemon.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/18/23.
//

import Foundation

struct Pokemon: Identifiable, Encodable, Hashable{
    var id: Int
    let name: String
    let pokemonType: [PokemonType]
    let weaknesses: [PokemonType]
    let height: Double
    let weight: Double
    let previousEvol: [Int]
    let nextEvol: [Int]
    var isCaptured: Bool
    
    enum CodingKeys : String, CodingKey {
        case pokemonType = "types"
        case previousEvol = "prev_evolution"
        case nextEvol = "next_evolution"
        case id, name, weaknesses, height, weight, isCaptured
    }
    
    static let standard = Pokemon(id: 1, name: "John", pokemonType: [PokemonType.dragon], weaknesses: [PokemonType.bug], height: 4.5, weight: 6.7, previousEvol: [], nextEvol: [], isCaptured: false)
}

extension Pokemon: Decodable{
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        pokemonType = try values.decode([PokemonType].self, forKey: .pokemonType)
        weaknesses = try values.decode([PokemonType].self, forKey: .weaknesses)
        height = try values.decode(Double.self, forKey: .height)
        weight = try values.decode(Double.self, forKey: .weight)
        previousEvol = try values.decodeIfPresent([Int].self, forKey: .previousEvol) ?? []
        nextEvol = try values.decodeIfPresent([Int].self, forKey: .nextEvol) ?? []
        isCaptured = try values.decodeIfPresent(Bool.self, forKey: .isCaptured) ?? false
    }
}
