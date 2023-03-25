//
//  HomeTabRowView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/25/23.
//

import SwiftUI

struct HomeTabRowView: View {
    @EnvironmentObject var manager : PokemonManager
    let type: PokemonType
    @State var moveView = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text(type.rawValue)
                    .font(.headline)
                    .bold()
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(manager.pokemon){ p in
                            if (p.pokemonType.contains(type)){
                                NavigationLink{
                                    PokemonDetailsView(pokemon: p)
                                }label: {
                                    PokemonCardView(pokemon: p)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeTabRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabRowView(type: PokemonType.dragon)
            .environmentObject(PokemonManager())
    }
}
