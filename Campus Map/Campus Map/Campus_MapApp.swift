//
//  Campus_MapApp.swift
//  Campus Map
//
//  Created by Tursunpulat Orolov on 2/19/23.
//

import SwiftUI

@main
struct Campus_MapApp: App {
    @StateObject var manager = MapManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
