//
//  ArcadeGameView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/30/23.
//

import SwiftUI

struct ArcadeGameView: View {
    @EnvironmentObject var manager : GameManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var timerRemain = 300
    @State var timeRun = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            GMSStreetView(manager: manager)
                .ignoresSafeArea()
                .sheet(isPresented: $manager.isGuess) {
                   GuessView()
                }
                .sheet(isPresented: $manager.gameEnd){
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
                }
                .onAppear{
                    timeRun = true
                }

            
            VStack{
                Text("\(timerRemain) seconds")
                    .onReceive(timer){ _ in
                        if timerRemain > 0 && timeRun {
                            timerRemain -= 1
                        }else{
                            timeRun = false
                            manager.gameEnd = true
                        }
                    }
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.red)
                
                Text("Points \(manager.game.totalScore)")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color.red)
            }
            .position(CGPoint(x: 320, y: 10))
            
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

struct ArcadeGameView_Previews: PreviewProvider {
    static var previews: some View {
        ArcadeGameView()
            .environmentObject(GameManager())
    }
}
