//
//  GuessView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/16/23.
//

import SwiftUI

struct GuessView: View {
    @EnvironmentObject var manager: GameManager
    var body: some View {
        ZStack{
            GMSMap(manager: manager)
                .ignoresSafeArea()
            
            Button{
                manager.isGuess.toggle()
                manager.round! += 1
            }label: {
                ButtonsView(buttonTitle: "Submit", color: Color.black)
                    .frame(width: 80, height: 30)
            }.offset(CGSize(width: 0, height: 300))
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView()
            .environmentObject(GameManager())
    }
}
