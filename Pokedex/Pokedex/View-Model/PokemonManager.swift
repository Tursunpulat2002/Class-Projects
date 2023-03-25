//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/18/23.
//

import Foundation
import SwiftUI

class PokemonManager: ObservableObject{
    @Published var pokemon: [Pokemon]
    let storageManager: StorageManager<[Pokemon]>
    @Published var pokemonType : String
    
    init(){
        let filename = "pokedex"
        storageManager = StorageManager<[Pokemon]>(filename: filename)
        pokemon = storageManager.modelData ?? []
        pokemonType = "None"
    }
}
