//
//  HintView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/29/23.
//

import SwiftUI

struct HintView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        Form{
            Section(header: Text("Summary")) {
                Text("Total number of words: \(manager.numOfWordsPossible().count)")
                Text("Total possible points: \(manager.totalPossiblePoints())")
                Text("Total number of panagrams: \(manager.totalPanagrams())")
            }
            ForEach(4..<16){i in
                Section(header: Text("WORDS OF LENGTH \(i)")) {
                    ForEach(0..<manager.game.letters.count, id: \.self){j in
                        let words = manager.wordsBeginningWithAndSize(letter: manager.game.letters[j], length: i)
                        Text("\(manager.game.letters[j]): \(manager.numOfWordsBeginningWith(letter: manager.game.letters[j], bank: words))")
                    }
                }
            }
        }
    }
}

struct HintView_Previews: PreviewProvider {
    static var previews: some View {
        HintView()
    }
}
