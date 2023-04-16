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
            GMSMap(manager: manager)
                .ignoresSafeArea()
        }
    }
}

struct SoloGameView_Previews: PreviewProvider {
    static var previews: some View {
        SoloGameView()
            .environmentObject(GameManager())
    }
}
