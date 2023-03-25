//
//  EvolutionsView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/25/23.
//

import SwiftUI

struct EvolutionsView: View {
    @EnvironmentObject var manager: PokemonManager
    let pokemon: Pokemon
    var body: some View {
        VStack{
            if(!pokemon.previousEvol.isEmpty){
                Text("Previous Evolution")
                    .bold()
                    .font(.system(size: 23))
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0..<pokemon.previousEvol.count, id:\.self){i in
                            let ind = pokemon.previousEvol[i]
                            NavigationLink{
                                PokemonDetailsView(pokemon: manager.pokemon[ind-1])
                            }label: {
                                PokemonCardView(pokemon: manager.pokemon[ind-1])
                            }
                        }
                    }
                }
            }
            
            if(!pokemon.nextEvol.isEmpty){
                Text("Next Evolution")
                    .bold()
                    .font(.system(size: 23))
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0..<pokemon.nextEvol.count, id:\.self){i in
                            let ind = pokemon.nextEvol[i]
                            NavigationLink{
                                PokemonDetailsView(pokemon: manager.pokemon[ind-1])
                            }label: {
                                PokemonCardView(pokemon: manager.pokemon[ind-1])
                            }
                        }
                    }
                }
            }
        }
    }
}

struct EvolutionsView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionsView(pokemon: Pokemon.standard)
            .environmentObject(PokemonManager())
    }
}
