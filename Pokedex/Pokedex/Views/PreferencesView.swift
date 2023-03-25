//
//  PreferencesView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/25/23.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var manager : PokemonManager
    var body: some View {
        Form{
            Section{
                Picker("Type", selection: $manager.pokemonType){
                    Text("None").tag("None")
                    ForEach(PokemonType.allCases){ type in
                        Text(type.rawValue).tag(type.rawValue)
                    }
                }
            }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
            .environmentObject(PokemonManager())
    }
}
