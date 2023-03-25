//
//  ContentView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/17/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: PokemonManager
    var body: some View {
        TabView{
            HomeTabView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ListTabView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PokemonManager())
    }
}
