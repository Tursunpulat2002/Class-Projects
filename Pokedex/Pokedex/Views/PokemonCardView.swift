//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/25/23.
//

import SwiftUI

struct PokemonCardView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack{
            Image(String.threeDigits(pokemon.id))
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(8)
                .background(Color(pokemonType: pokemon.pokemonType[0]))
                .clipShape(RoundedRectangle(cornerRadius: 30))
            HStack{
                Text(pokemon.name)
                
                if (pokemon.isCaptured){
                    Image(systemName: "lasso.sparkles")
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: Pokemon.standard)
    }
}
