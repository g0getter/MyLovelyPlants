//
//  ContentView.swift
//  MyLovelyPlants
//
//  Created by 여나경 on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    SampleView()
                } label: {
                    Text("Wanna know when to water?")
                }
                Text("Let's see its lovely days")
                Text("Explanation of my lovely one")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
