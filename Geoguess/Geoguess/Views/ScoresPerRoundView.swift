//
//  ScoresPerRoundView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/30/23.
//

import SwiftUI

struct ScoresPerRoundView: View {
    let scores: [Int]
    var body: some View {
        VStack{
            Text("Scores")
            ForEach(scores, id: \.self) { score in
                HStack{
                    Text("\(score)")
                }
            }
        }
    }
}

struct ScoresPerRoundView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresPerRoundView(scores: Game.standard.scoresPerRound)
    }
}
