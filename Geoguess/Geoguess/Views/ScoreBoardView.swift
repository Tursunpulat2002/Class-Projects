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
            HStack{
                Text("Game")
                Text("Player")
                Text("Locations")
                Text("Score/Round")
                Text("Total Score")
            }
            ForEach (manager.games) {game in
                HStack{
                    Text("\(game.gameType)")
                    Text("\(game.playerNumber)")
                    LocationPerRoundView(locations: game.locationPerRound)
                    ScoresPerRoundView(scores: game.scoresPerRound)
                    Text("\(game.totalScore)")
                }
            }
        }.position(CGPoint(x: 200, y: 70))
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
            .environmentObject(GameManager())
    }
}
