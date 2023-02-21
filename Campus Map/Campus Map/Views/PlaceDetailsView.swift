//
//  PlaceDetailsView.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import SwiftUI

struct PlaceDetailsView: View {
    @EnvironmentObject var manager : MapManager
    var building : Building
    var place : Place?
    
    private var isFavorite : Bool {
        guard place != nil else {return false}
        return place!.favorite
    }
    
    @State var angle = 90.0
    var repeatingAnimation: Animation {
        Animation
            .easeInOut(duration: 2)
            .repeatForever()
    }
    
    var body: some View {
        return VStack {
            Image(systemName: isFavorite ? "star.fill" : "circle.grid.hex.fill")
                .font(.system(size:80))
                .padding()
                .rotationEffect(.degrees(angle))
                .foregroundColor(isFavorite ? .yellow : .cyan)
            Text(building.name)
                .font(.system(size:30))
                .padding()
            Image(building.photo ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text(isFavorite ? "Favorited" : "Not Favorited")
                .padding()
            Button(isFavorite ? "unfavorite" : "favorite") {
                manager.toggleFavorite(place: place!)
            }.padding()
        }
        .onAppear {
            withAnimation(self.repeatingAnimation) { self.angle = -90 }
        }
    }
}
