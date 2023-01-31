//
//  PreferencesView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/29/23.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        Form{
            Section(header: Text("Language")) {
                Picker("Language", selection: $manager.language){
                    ForEach(Language.allCases, id: \.self) { lang in
                        Text("\(lang.rawValue)")
                    }
                }.pickerStyle(.segmented)
            }
            Section(header: Text("Number of Letter")) {
                Picker("Number of Letter", selection: $manager.problemSize){
                    ForEach(ProblemSize.allCases, id: \.self) { size in
                        Text("\(size.number())")
                    }
                }.pickerStyle(.segmented)
            }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
            .environmentObject(WordsManager())
    }
}
