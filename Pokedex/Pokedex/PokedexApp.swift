//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/17/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject var manager = PokemonManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
