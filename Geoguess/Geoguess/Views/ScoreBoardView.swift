//
//  ScoreBoardView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/30/23.
//

import SwiftUI

struct ScoreBoardView: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        VStack(alignment: .leading){
            ScrollView{
                ForEach (manager.games) {game in
                    HStack{
                        VStack{
                            Text("Game")
                            Text("\(game.gameType)")
                        }
                        LocationPerRoundView(locations: game.locationPerRound)
                        ScoresPerRoundView(scores: game.scoresPerRound)
                        VStack{
                            Text("Total")
                            Text("\(game.totalScore)")
                        }
                    }
                }
            }
        }
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
            .environmentObject(GameManager())
    }
}
