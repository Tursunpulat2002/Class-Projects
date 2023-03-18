//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/18/23.
//

import SwiftUI

struct PokemonRowView: View {
    let pokemon: Pokemon
    var body: some View {
        HStack{
            Text("\(pokemon.id)")
            Text(pokemon.name)
            Spacer()
            Image(String.threeDigits(pokemon.id))
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding(8)
                .background(Color(pokemonType: pokemon.pokemonType[0]))
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
        }
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRowView(pokemon: Pokemon.standard)
    }
}
