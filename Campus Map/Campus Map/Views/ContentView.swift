//
//  ContentView.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager : MapManager
    @State var selectedSpot : Spot?
    @State private var isShowingSheet = false
    @State var builds = Building.buildings
    var body: some View {
        return NavigationStack{
//            CampusMapView()
            ZStack(alignment: Alignment.bottomTrailing){
            UIMap(manager: manager)
                        .ignoresSafeArea()
                        .sheet(isPresented: $manager.showSheet, content: {
                            PlaceDetailsView(building: manager.selectedBuilding!, place: manager.selectedPlace)
                        })
                        .sheet(isPresented: $manager.showRouteSheet, content: {
                            RouteDetailView()
                        })
                        .confirmationDialog("spot", isPresented: $manager.showConfirmation, presenting: manager.selectedPlace) { place in
                               Button("Details") {
                                   manager.selectedPlace = place
                                   manager.showSheet = true
                               }
                            
                                Button{
//                                    manager.selectedPlace = place
                                    manager.provideRoute()
//                                    manager.showRouteSheet = true
                                    
                                } label: {
                                    Text("Route Details")
                                }
                           } message: { place in
                               Text("\(place.title ?? "unknown")")
                        }
                
                Button{
                    manager.mapType = 0
                }label: {
                    Text("Standard")
                }.frame(width: 100, height: 50)
                    .padding()
                    .position(x:70, y: 0)
                Button{
                    manager.mapType = 1
                }label: {
                    Text("Hybrid")
                }.frame(width: 100, height: 50)
                    .padding()
                    .position(x:150, y: 0)
                Button{
                    manager.mapType = 2
                }label: {
                    Text("Imagery")
                }.frame(width: 100, height: 50)
                    .padding()
                    .position(x:230, y: 0)
            
                Button {
//                    manager.center()
                    manager.trackType.toggle()
                } label: {
                    Text("Track Mode")
                }.disabled(manager.isEQ)
                    .frame(width: 100, height: 50)
                    .padding()
                    .position(x:70, y: 680)
                        
                
                Button{
                    for i in 0..<manager.places.count{
                        if(manager.isSelected[i]){
                            manager.isSelected[i].toggle()
                        }
                    }
                    manager.unplot = true
                } label: {
                    Image(systemName: "pencil.slash")
                    Text("Unplot")
                }.frame(width: 100, height: 50)
                    .padding()
                    .position(x:200, y: 730)
                
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
                    .position(x:70, y: 730)
                
                
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                    Text("SHOW")
                }.frame(width: 100, height: 50)
                .padding()
                .position(x:320, y: 730)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MapManager())
    }
}
