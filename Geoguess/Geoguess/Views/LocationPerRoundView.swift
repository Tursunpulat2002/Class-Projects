//
//  LocationPerRoundView.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/30/23.
//

import SwiftUI

struct LocationPerRoundView: View {
    let locations: [Location]
    var body: some View {
        VStack{
            HStack{
                Text("Latitude")
                Text("Longitude")
            }
            ForEach(locations, id: \.self) { location in
                HStack{
                    Text("\(location.latitude)")
                    Text("\(location.longitude)")
                }
            }
        }
    }
}

struct LocationPerRoundView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPerRoundView(locations: Game.standard.locationPerRound)
    }
}
