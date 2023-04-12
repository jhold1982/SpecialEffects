//
//  ContentView.swift
//  SpecialEffects
//
//  Created by Justin Hold on 4/12/23.
//

import SwiftUI

struct ContentView: View {
	@State private var tabSelection = 0
    var body: some View {
		TabView(selection: $tabSelection) {
			HomeView()
				.tabItem {
					Label("Home", systemImage: "house")
				}
				.tag(0)
			ShadowsAndGlows()
				.tabItem {
					Label("Shadows", systemImage: "glowplug")
				}
				.tag(1)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
