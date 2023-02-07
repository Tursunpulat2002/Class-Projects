//
//  PentominoesApp.swift
//  Pentominoes
//
//  Created by Tursunpulat Orolov on 2/4/23.
//

import SwiftUI

@main
struct PentominoesApp: App {
    @StateObject var manager = GameManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
