//
//  EndGameView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/30/23.
//

import SwiftUI

struct EndGameView: View {
    @EnvironmentObject var manager: GameManager
    var body: some View {
        VStack{
            Text("Congratulations")
            Text("Your total points: \(manager.game.totalScore)")
            Button {
                manager.gameEnd.toggle()
                manager.endGame()
            } label: {
                ButtonsView(buttonTitle: "Home", color: Color.black)
                    .frame(width: 80, height: 30)
            }

        }
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
            .environmentObject(GameManager())
    }
}
