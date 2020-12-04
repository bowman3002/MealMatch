//
//  MealMatchApp.swift
//  MealMatch
//
//  Created by Austin Dumm on 12/4/20.
//

import SwiftUI

@main
struct MealMatchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SwipeObserver())
        }
    }
}
