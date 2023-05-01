//
//  HomeScreenView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/15/23.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var manager: GameManager
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Home_Background")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.9)
                    
                VStack{
                    Text("GEOGUESS")
                        .font(.system(size: 60))
                        .foregroundColor(Color.red)
                        .bold()
                    
                    NavigationLink{
                        SoloGameView()
                    }label: {
                        ButtonsView(buttonTitle: "Solo", color: Color.black)
                            .foregroundColor(Color.blue)
                            .frame(width: 150, height: 70)
                    }.padding()
                        .onSubmit{
                            manager.game.gameType = "Solo"
                        }
                    
                    NavigationLink{
                        
                    }label: {
                        ButtonsView(buttonTitle: "Arcade", color: Color.black)
                            .foregroundColor(Color.blue)
                            .frame(width: 150, height: 70)
                    }.padding()
                        .onTapGesture {
                            manager.game.gameType = "Arcade"
                        }
                    
                    NavigationLink{
                        
                    }label: {
                        ButtonsView(buttonTitle: "Score Board", color: Color.black)
                            .foregroundColor(Color.blue)
                            .frame(width: 150, height: 70)
                    }.padding()
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(GameManager())
    }
}
