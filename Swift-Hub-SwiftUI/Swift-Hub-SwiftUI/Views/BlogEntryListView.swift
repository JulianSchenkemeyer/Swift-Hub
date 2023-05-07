//
//  ListView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 03.05.23.
//

import SwiftUI

struct BlogEntryListView: View {
	var items: [BlogEntry] = []

    var body: some View {
			List(items) { item in
				NavigationLink(value: item) {
					ListEntryView(title: item.title, updatedAt: item.formattedDate)
				}
			}
			.navigationDestination(for: BlogEntry.self, destination: BlogContentView.init)
			.listStyle(.plain)
    }
}
