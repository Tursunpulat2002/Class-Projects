//
//  Lion_SpellApp.swift
//  Lion Spell
//
//  Created by Tursunpulat Orolov on 1/15/23.
//

import SwiftUI

@main
struct Lion_SpellApp: App {
    @StateObject var manager = WordsManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
