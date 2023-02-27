//
//  CampusMapView.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import Foundation
import SwiftUI
import MapKit

struct CampusMapView: View {
    @EnvironmentObject var manager : MapManager
    @State var selectedSpot : Spot?
    @State private var isShowingSheet = false
    @State var builds = Building.buildings
    var body: some View {
        ZStack(alignment: Alignment.bottomTrailing){
            Map(coordinateRegion: $manager.region, showsUserLocation: true, annotationItems: manager.places, annotationContent: annotationFor(place:))
            
            Button {
                manager.center()
            } label: {
                Image(systemName: "lasso")
                Text("Center")
            }.disabled(manager.isEQ)
                .frame(width: 100, height: 50)
                .padding()
                .position(x:70, y: 760)
                    
            
            Button{
                for i in 0..<manager.places.count{
                    if(manager.isSelected[i]){
                        manager.isSelected[i].toggle()
                    }
                }
            } label: {
                Image(systemName: "pencil.slash")
                Text("Unplot")
            }.frame(width: 100, height: 50)
                .padding()
                .position(x:200, y: 810)
            
            Button{
                for i in 0..<manager.places.count{
                    if(manager.isSelected[i]){
                        if(manager.places[i].favorite){
                            manager.isSelected[i].toggle()
                        }
                    }else{
                        if(manager.places[i].favorite){
                            manager.isSelected[i].toggle()
                        }
                    }
                }
            } label: {
                Image(systemName: "star.fill")
                Text("Favorites")
            }.frame(width: 100, height: 50)
                .padding()
                .position(x:70, y: 810)
            
            
            Button {
                isShowingSheet.toggle()
            } label: {
                Image(systemName: "magnifyingglass")
                Text("SHOW")
            }.frame(width: 100, height: 50)
            .padding()
            .sheet(isPresented: $isShowingSheet) {
                NavigationStack{
                    
                    Button("Dismiss"){
                        isShowingSheet = false
                        manager.showAll()
                    }.padding(.top)
                    HStack{
                        Button("All"){
                            builds = Building.buildings.filter{ build in
                                return true
                            }
                        }.padding()
                        
                        Button("Favorites"){
                            builds = Building.buildings.filter({ building in
                                let index = Building.buildings.firstIndex(of: building)
                                return manager.isFavorited[index!]
                            })
                        }.padding()
                        
                        Button("Nearby"){
                            builds = manager.isNearby()
                        }.padding()
                        
                    }
                    
                    List(builds){ b in
                        let index = Building.buildings.firstIndex(of: b)
                        Button(b.name){
                            manager.selectedBuilding = b
                            manager.isSelected[index!].toggle()
                        }.background(manager.isSelected[index!] ? Color.red.opacity(0.2): Color.clear)
                    }
                }
            }
        }
    }
}

struct CampusMapView_Previews: PreviewProvider {
    static var previews: some View {
        CampusMapView()
            .ignoresSafeArea()
            .environmentObject(MapManager())
    }
}
