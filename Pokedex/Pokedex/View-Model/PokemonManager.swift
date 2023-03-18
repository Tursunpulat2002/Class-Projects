//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/18/23.
//

import Foundation

class PokemonManager: ObservableObject{
    @Published var pokemon: [Pokemon]
    let storageManager: StorageManager<[Pokemon]>
    
    init(){
        let filename = "pokedex"
        storageManager = StorageManager<[Pokemon]>(filename: filename)
        pokemon = storageManager.modelData ?? []
    }
}
