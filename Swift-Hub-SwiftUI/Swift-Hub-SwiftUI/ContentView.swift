//
//  ContentView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 03.05.23.
//

import SwiftUI

struct ContentView: View {



    var body: some View {

			TabView {
				BlogView()
					.tabItem {
						Label("Blog", systemImage: "swift")
					}
					.tag(0)
				Text("Proposals")
					.tabItem {
						Label("Proposals", systemImage: "text.bubble.fill")
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
