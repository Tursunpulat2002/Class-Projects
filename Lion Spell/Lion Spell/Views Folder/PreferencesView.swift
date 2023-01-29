//
//  PreferencesView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/29/23.
//

import SwiftUI

struct PreferencesView: View {
    @Binding var preferences: Preferences
    var body: some View {
        Form{
            Section(header: Text("Language")) {
                Picker("Language", selection: $preferences.language){
                    ForEach(Preferences.languageOptions, id: \.self){ c in
                        Text(c)
                    }
                }
            }
            Section(header: Text("Number of Letter")) {
                Picker("Number of Letter", selection: $preferences.numOfLetters){
                    ForEach(Preferences.numOfLettersOptions, id: \.self){ c in
                        Text("\(c)")
                    }
                }
            }
        }
    }
}

//struct PreferencesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreferencesView(preferences: )
//    }
//}
