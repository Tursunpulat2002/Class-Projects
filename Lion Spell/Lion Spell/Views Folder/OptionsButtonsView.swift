//
//  OptionsButtonsView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/16/23.
//

import SwiftUI

struct OptionsButtonsView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        HStack{
            Button(action: {manager.newGame()}){
                Text("New Game")
            }.buttonStyle(.borderedProminent)
            
            Spacer()
            
            Button(action: {}){
                Text("Hints")
            }.buttonStyle(.borderedProminent)
            
            Spacer()
            
            Button(action: {}){
                Text("Preferences")
            }.buttonStyle(.borderedProminent)
        }.padding()
            .frame(maxHeight: .infinity ,alignment: .bottom)
    }
}

struct OptionsButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsButtonsView()
            .environmentObject(WordsManager())
    }
}
