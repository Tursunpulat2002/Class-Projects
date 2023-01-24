//
//  LettersView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

struct LettersView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        HStack{
            ForEach(0..<manager.game.typedLetters.count, id: \.self){i in
                Text("\(manager.game.typedLetters[i]) ")
            }
        }
    }
}

struct LettersView_Previews: PreviewProvider {
    static var previews: some View {
        LettersView()
            .environmentObject(WordsManager())
    }
}
