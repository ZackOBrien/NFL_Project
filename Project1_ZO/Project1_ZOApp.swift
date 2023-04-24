//
//  Project1_ZOApp.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/28/22.
//

import SwiftUI

@main
struct Project1_ZOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
