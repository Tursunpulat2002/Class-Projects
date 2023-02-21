//
//  ContentView.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager : MapManager
    var body: some View {
        return NavigationStack{
            CampusMapView()
                        .ignoresSafeArea()
                        .sheet(isPresented: $manager.showSheet, content: {
                            PlaceDetailsView(building: manager.selectedBuilding!, place: manager.selectedPlace)
                        })
                        .confirmationDialog("spot", isPresented: $manager.showConfirmation, presenting: manager.selectedPlace) { place in
                               Button("Details") {
                                   manager.selectedPlace = place
                                   manager.showSheet = true
                               }
                           } message: { place in
                               Text("\(place.title ?? "unknown")")
                        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MapManager())
    }
}
