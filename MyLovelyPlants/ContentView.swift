//
//  ContentView.swift
//  MyLovelyPlants
//
//  Created by 여나경 on 2023/06/29.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<CalendarFeature>
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    CalendarView(
                        store: store
                    )
                } label: {
                    Text("Wanna know when to water?")
                }
                Text("Let's see its lovely days")
                NavigationLink {
                    DescriptionView()
                } label: {
                    Text("Explanation of my lovely one")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store:
                Store(initialState: CalendarFeature.State()) {
                    CalendarFeature()
                }
        )
    }
}
