//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/17/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var manager = PokemonManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
                .onChange(of: scenePhase) { phase in
                                    switch phase {
                                    case .background:
                                        break
                                    case .active:
                                        break
                                    case .inactive:
                                        manager.storageManager.save(modelData: manager.pokemon)
                                    @unknown default:
                                        assert(false, "Uknown scene Phase")
                                    }
                                }
        }
    }
}
