//
//  BlogContentView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 04.05.23.
//

import SwiftUI
import SafariServices

struct BlogContentView: View {

	var title: String
	var published: String
	var content: String
	var link: String

    var body: some View {
		VStack(alignment: .leading) {
			Text("Title")
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.primary)

			Text("Published at 04. Mai 2023")
				.font(.callout)
				.fontWeight(.semibold)
				.foregroundColor(.secondary)

			Rectangle()
				.fill()
				.frame(height: 2)

			Spacer(minLength: 20)

			ScrollView {
				VStack {
					Text(content)
						.font(.body)

					Spacer(minLength: 80)

					Button {
						print("open in Safari")
					} label: {
						Label("Open in Safari", systemImage: "safari")
							.padding(10)
					}
					.buttonStyle(.borderedProminent)
				}
			}


		}
		.padding()
    }
}

struct BlogContentView_Previews: PreviewProvider {
	static var title = "Title #1"
	static var published = "04. Mai 2023"
	static var content = """
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""

    static var previews: some View {
		BlogContentView(title: title,
						published: published,
						content: content,
						link: "")
    }
}
