//
//  BlogContentView.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 04.05.23.
//

import SwiftUI

struct BlogContentView: View {

	var title: String
	var published: String
	var content: String
	var link: String

	init(_ data: BlogEntry) {
		self.title = data.title
		self.published = data.formattedDate
		self.link = data.link
		self.content = data.content
	}

    var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.primary)

			Text("Published at \(published)")
				.font(.callout)
				.fontWeight(.semibold)
				.foregroundColor(.secondary)

			Rectangle()
				.fill()
				.frame(height: 2)

			Spacer(minLength: 20)

			HTMLView(htmlContent: content)

		}
		.padding()
		.navigationBarTitleDisplayMode(.inline)
    }
}

//struct BlogContentView_Previews: PreviewProvider {
//	static var title = "Title #1"
//	static var published = "04. Mai 2023"
//	static var content = """
//Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
//"""
//
//    static var previews: some View {
//		BlogContentView(title: title,
//						published: published,
//						content: content,
//						link: "")
//    }
//}
