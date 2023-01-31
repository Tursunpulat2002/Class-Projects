//
//  OptionsButtonsView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/16/23.
//

import SwiftUI

struct OptionsButtonsView: View {
    @EnvironmentObject var manager: WordsManager
    @State var showPreferences: Bool = false
    @State var showHint: Bool = false
    var body: some View {
        HStack{
            Button(action: {manager.newGame()}){
                Text("New Game")
            }.buttonStyle(.borderedProminent)
            
            Spacer()
            
            Button(action: {showHint = true}){
                Text("Hints")
            }.buttonStyle(.borderedProminent)
            
            Spacer()
            
            Button(action: {showPreferences = true}){
                Text("Preferences")
            }.buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(maxHeight: .infinity ,alignment: .bottom)
        .sheet(isPresented: $showPreferences){
            manager.preferencesClosed()
        }content:{
            PreferencesView()
        }
        .sheet(isPresented: $showHint, content:{
            HintView()
        })
    }
}

struct OptionsButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsButtonsView(showPreferences: false)
            .environmentObject(WordsManager())
    }
}
