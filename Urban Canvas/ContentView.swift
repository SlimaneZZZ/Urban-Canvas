//
//  ContentView.swift
//  Urban Canvas
//
//  Created by Petit dragon on 22/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PickerView()
                .tabItem {
                    Label("Œuvres", systemImage: "photo.artframe.circle")
                }
            
            CartesArtistes()
                .tabItem {
                    Label("Auteurs", systemImage: "person.circle")
                }
        }
        .tint(.mainOrange)
    }
}

#Preview {
    ContentView()
}
