//
//  ListView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 03.05.23.
//

import SwiftUI

struct ListView<T: Identifiable & Hashable>: View {
	var items: [T] = []

    var body: some View {
			List(items) { item in
				NavigationLink(value: item) {
					ListEntryView(title: "")
				}
//
			}
			.navigationDestination(for: T.self, destination: NavigationTest.init)
    }
}

struct NavigationTest<T>: View {
	var data: T

	var body: some View {
		Text("hello")
	}
}

struct ListView_Previews: PreviewProvider {
	static let items: [demoType] = [
		demoType(),
		demoType(),
		demoType()
	]
    static var previews: some View {
		ListView<demoType>(items: items)
    }
}

struct demoType: Identifiable, Hashable {
	let id = UUID()
}
