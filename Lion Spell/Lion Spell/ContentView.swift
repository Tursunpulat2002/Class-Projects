//
//  ContentView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.cyan
                .ignoresSafeArea()
            VStack{
                TitleView()
                WordListView(list: ["thing 1", "thing 2", "thing 3"])
                LettersView(list: ["a", "b", "c", "d"])
                LetterButtonsView()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
