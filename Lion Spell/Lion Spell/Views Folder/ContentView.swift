//
//  ContentView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        ZStack{
            Color.cyan
                .ignoresSafeArea()
            VStack{
                TitleView()
                WordListView()
                LettersView()
                LetterButtonsView()
                SubmitDeleteButtonsView()
                ScoreView()
                OptionsButtonsView()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WordsManager())
    }
}
