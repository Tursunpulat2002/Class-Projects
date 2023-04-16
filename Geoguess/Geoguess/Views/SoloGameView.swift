//
//  SoloGameView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/15/23.
//

import SwiftUI

struct SoloGameView: View {
    @EnvironmentObject var manager : GameManager
    
    var body: some View {
        ZStack{
            GMSStreetView(manager: manager)
                .ignoresSafeArea()
                .sheet(isPresented: $manager.isGuess) {
                   GuessView()
                }
            
            Button {
                manager.isGuess = true
            } label: {
                ButtonsView(buttonTitle: "Guess", color: Color.black)
                    .frame(width: 80, height: 30)
            }.offset(CGSize(width: 0, height: 350))

        }
    }
}

struct SoloGameView_Previews: PreviewProvider {
    static var previews: some View {
        SoloGameView()
            .environmentObject(GameManager())
    }
}
