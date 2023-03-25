//
//  TypesAndWeaknessesView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/25/23.
//

import SwiftUI

struct TypesAndWeaknessesView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack{
            Text("Types")
                .bold()
                .font(.system(size: 23))
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(pokemon.pokemonType){type in
                        TypesView(type: type)
                    }
                }
            }.padding(.horizontal)
                .padding(.bottom, 8)
            
            Text("Weaknesses")
                .bold()
                .font(.system(size: 23))
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(pokemon.weaknesses){type in
                        TypesView(type: type)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct TypesAndWeaknessesView_Previews: PreviewProvider {
    static var previews: some View {
        TypesAndWeaknessesView(pokemon: Pokemon.standard)
    }
}
