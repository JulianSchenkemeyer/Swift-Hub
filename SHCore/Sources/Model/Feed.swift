//
//  Feed.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


public struct Feed: CustomStringConvertible, Equatable {

	public let title: String
	public let updated: String
	public let id: String
	public let entries: [Entry]

	public init(title: String, updated: String, id: String, entries: [Entry]) {
		self.title = title
		self.updated = updated
		self.id = id
		self.entries = entries
	}

	public var description: String {
		return """
Feed Entry
 title: \(title)
 updated: \(updated)
 id: \(id)
 entries: \(entries)
"""
	}
}
