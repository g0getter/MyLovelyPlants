//
//  MyLovelyPlantsApp.swift
//  MyLovelyPlants
//
//  Created by 여나경 on 2023/06/29.
//

import SwiftUI
import ComposableArchitecture

@main
struct MyLovelyPlantsApp: App {
    static let store = Store(initialState: CalendarFeature.State()) {
        CalendarFeature()
//        ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: MyLovelyPlantsApp.store)
        }
    }
}
