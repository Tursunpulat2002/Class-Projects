//
//  SoloGameView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/15/23.
//

import SwiftUI

struct SoloGameView: View {
    @EnvironmentObject var manager : GameManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            GMSStreetView(manager: manager)
                .ignoresSafeArea()
                .sheet(isPresented: $manager.isGuess) {
                   GuessView()
                }
                .sheet(isPresented: $manager.gameEnd, content: {
                    Text("Congratulations")
                    Text("Your total points: \(manager.game.totalScore)")
                    Button{
                        manager.gameEnd.toggle()
                        manager.endGame()
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        ButtonsView(buttonTitle: "Home", color: Color.black)
                            .frame(width: 80, height: 30)
                    }
                })

            
            VStack{
                Text("Round \(manager.round)")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color.red)
                
                Text("Points \(manager.game.totalScore)")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color.red)
            }
            .position(CGPoint(x: 330, y: 10))
            
            Button {
                manager.isGuess = true
                manager.game.locationPerRound.append(Location(latitude: (manager.location?.coordinate.latitude)!, longitude: (manager.location?.coordinate.longitude)!))
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
