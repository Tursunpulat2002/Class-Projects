//
//  ContentView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/17/23.
//

import SwiftUI

struct SectionHeaderView : View {
    let title : String
    var body: some View {
        HStack{
            Text(title)
                .font(.title)
                .bold()
        }
        .foregroundColor(.cyan)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct ContentView: View {
    @EnvironmentObject var manager: PokemonManager
    var body: some View {
        ZStack {
            Color("PokemonColor").ignoresSafeArea()
            
            NavigationStack{
                List{
                    Section(header: SectionHeaderView(title: "Pokédex")){
                        ForEach(manager.pokemon, id: \.self){i in
                            NavigationLink{
                                PokemonDetailsView(pokemon: i)
                            }label: {
                                PokemonRowView(pokemon: i)
                            }
                        }
                    }
                }
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
