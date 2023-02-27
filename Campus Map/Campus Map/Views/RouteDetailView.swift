//
//  RouteDetailView.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/26/23.
//

import SwiftUI

struct RouteDetailView: View {
    @EnvironmentObject var manager : MapManager
    
    var body: some View {
        VStack{
            Text(manager.ETA).bold()
            
            if(manager.heading<=45.0){
                Text("Move North towards \(manager.heading) degrees")
            }else if(manager.heading<=90.0){
                Text("Move East towards \(manager.heading) degrees")
            }else if(manager.heading<=180.0){
                Text("Move South towards \(manager.heading) degrees")
            }else if(manager.heading<=270.0){
                Text("Move West towards \(manager.heading) degrees")
            }else{
                Text("Move North towards \(manager.heading) degrees")
            }
        }
    }
}
