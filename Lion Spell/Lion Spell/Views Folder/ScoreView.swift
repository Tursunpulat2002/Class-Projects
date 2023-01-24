//
//  ScoreView.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/16/23.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var manager: WordsManager
    var body: some View {
        Text("\(manager.game.score)")
            .font(.title)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
            .environmentObject(WordsManager())
    }
}
