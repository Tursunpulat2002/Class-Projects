//
//  HomeScreenView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/15/23.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Home_Background")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.5)

                NavigationLink{
                    SoloGameView()
                }label: {
                    ButtonsView(buttonTitle: "Solo", color: Color.black)
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
