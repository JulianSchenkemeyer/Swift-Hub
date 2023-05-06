//
//  ListEntry.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 03.05.23.
//

import SwiftUI

struct ListEntryView: View {
	var title = ""
	var updatedAt = ""


    var body: some View {
		VStack(alignment: .leading) {
			Text("\(title)")
				.font(.title3)
				.foregroundColor(.primary)
			Text("\(updatedAt)")
				.font(.footnote)
				.foregroundColor(.secondary)
		}
		.padding()

    }
}

struct ListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ListEntryView(title: "Blog Entry #1", updatedAt: "03. Mai 2023")
    }
}
