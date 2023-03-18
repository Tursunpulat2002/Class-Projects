//
//  TypesView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/18/23.
//

import SwiftUI

struct TypesView: View {
    let type: PokemonType
    var body: some View {
        ZStack{
            Text(type.rawValue)
                .foregroundColor(Color.white)
                .padding(9)
                .background(Color(pokemonType: type))
                .clipShape(RoundedRectangle(cornerRadius: 100))
        }
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(type: PokemonType.dragon)
    }
}
