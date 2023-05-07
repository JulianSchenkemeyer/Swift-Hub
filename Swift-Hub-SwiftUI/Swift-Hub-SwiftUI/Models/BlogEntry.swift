//
//  BlogEntry.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 07.05.23.
//

import Foundation
import Model


struct BlogEntry: Identifiable, Hashable {

	private static var dateFormatter: DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		return dateFormatter
	}

	let id: String
	let title: String
	let link: String
	let updated: Date
	let content: String

	var formattedDate: String {
		updated.formatted(date: .abbreviated, time: .omitted)
	}

	init(_ data: Entry) {
		self.id = data.id
		self.title = data.title
		self.link = data.link
		self.content = data.content
		self.updated = BlogEntry.dateFormatter.date(from: data.updated)!
	}
}
