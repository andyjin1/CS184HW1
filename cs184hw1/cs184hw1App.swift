//
//  cs184hw1App.swift
//  cs184hw1
//
//  Created by Andy Jin on 10/23/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
@main
struct cs184hw1App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()

        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("Configured Firebase!!!!")
    return true
  }
}

