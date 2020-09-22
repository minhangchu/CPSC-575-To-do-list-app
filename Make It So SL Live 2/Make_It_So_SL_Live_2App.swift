//
//  Make_It_So_SL_Live_2App.swift
//  Make It So SL Live 2
//
//  Created by user180010 on 9/21/20.
//

import SwiftUI
import UIKit

@main
struct Make_It_So_SL_Live_2App: App {
    // Create a reference to the App Delegate
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}

struct Make_It_So_SL_Live_2App_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
