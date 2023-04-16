//
//  GeoguessApp.swift
//  Geoguess
//
//  Created by Tursunpulat Orolov on 4/14/23.
//

import SwiftUI
import GoogleMaps

@main
struct GeoguessApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var manager = GameManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey("AIzaSyDGJVMkerleqSraX1dj6y0w8tUSg7-g_Fo")
        return true
    }
}
