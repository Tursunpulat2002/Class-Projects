//
//  GeoguessApp.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/14/23.
//

import SwiftUI

@main
struct GeoguessApp: App {
    @StateObject var manager = GameManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
