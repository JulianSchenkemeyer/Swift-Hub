//
//  Feed.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


public struct Feed: CustomStringConvertible {
	let title: String
	let updated: String
	let id: String
	let entries: [Entry]

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
