//
//  HomeTabView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/25/23.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var manager: PokemonManager
    var body: some View {
        NavigationStack{
            ZStack(alignment: .leading){
                Color("PokemonColor").ignoresSafeArea()
                ScrollView{
                    if (manager.pokemon.contains(where: { Pokemon in
                        return Pokemon.isCaptured
                    })){
                        Text("CAPTURED")
                            .font(.headline)
                            .bold()
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(manager.pokemon){ p in
                                    if (p.isCaptured){
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
                    ForEach(PokemonType.allCases){ type in
                        HomeTabRowView(type: type)
                    }
                }
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
            .environmentObject(PokemonManager())
    }
}
