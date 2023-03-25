//
//  ListTabView.swift
//  Pokedex
//
//  Created by Tursunpulat Orolov on 3/25/23.
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

struct ListTabView: View {
    @EnvironmentObject var manager: PokemonManager
    @State var showPreferences = false
    var body: some View {
        NavigationStack{
                List{
                    Section(header: SectionHeaderView(title: "Pokédex")){
                        if(manager.pokemonType == "None"){
                            ForEach(manager.pokemon, id: \.self){i in
                                NavigationLink{
                                    PokemonDetailsView(pokemon: i)
                                }label: {
                                    PokemonRowView(pokemon: i)
                                }
                            }
                        }else{
                            ForEach(manager.pokemon.filter({ Pokemon in
                                return Pokemon.pokemonType.contains(PokemonType(rawValue: manager.pokemonType)!)
                            }), id: \.self){ i in
                                NavigationLink{
                                    PokemonDetailsView(pokemon: i)
                                }label: {
                                    PokemonRowView(pokemon: i)
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $showPreferences, content: {
                    PreferencesView()
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showPreferences = true
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                }
        }
    }
}

struct ListTabView_Previews: PreviewProvider {
    static var previews: some View {
        ListTabView()
            .environmentObject(PokemonManager())
    }
}
