//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/18/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    let pokemon: Pokemon
    var body: some View {
        ZStack{
            Color("PokemonColor").ignoresSafeArea()
            VStack{
                Text(pokemon.name)
                    .bold()
                    .font(.system(size: 26))
                ZStack{
                    Image(String.threeDigits(pokemon.id))
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 350, height: 350)
                        .padding()
                        .background(Color(pokemonType: pokemon.pokemonType[0]))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Text(String.threeDigits(pokemon.id))
                        .bold()
                        .offset(x: 160, y: 160)
                }
                
                HStack{
                    Text("Height")
                        .padding(.horizontal, 50)
                        .padding(.top, 10)
                        .bold()
                        .font(.system(size: 23))
                    
                    Text("Weight")
                        .padding(.horizontal, 50)
                        .padding(.top, 10)
                        .bold()
                        .font(.system(size: 23))
                }
                HStack{
                    Text(String(format: "%2.2f m", pokemon.height))
                        .bold()
                        .font(.system(size: 27))
                    
                    Spacer()
                    
                    Text(String(format: "%2.2f kg", pokemon.weight))
                        .bold()
                        .font(.system(size: 27))
                }.padding(.horizontal, 50)
                    .padding(.bottom, 8)
                
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
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: Pokemon.standard)
    }
}
