//
//  ContentView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/14/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        ZStack {
            HomeScreenView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameManager())
    }
}
