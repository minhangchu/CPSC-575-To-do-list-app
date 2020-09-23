//
//  Assignment2App.swift
//  Assignment2
//
//  Created by user180010 on 9/22/20.
//

import SwiftUI
import Firebase
import UIKit // We will need UIKit to implement AppDelegate
@main
struct Assignment2App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure FirebaseApp
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        return true
    }
}
