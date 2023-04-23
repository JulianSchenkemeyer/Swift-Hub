//
//  Entry.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


public struct Entry: CustomStringConvertible {
	public let title: String
	public let link: String
	public let updated: String
	public let id: String
	public let content: String

	public init(title: String, link: String, updated: String, id: String, content: String) {
		self.title = title
		self.link = link
		self.updated = updated
		self.id = id
		self.content = content
	}


	public var description: String {
		return """
\n
 Entry
  title: \(title)
  updated: \(updated)
  id: \(id)
  link: \(link)
  content: \(content)
\n
"""
	}
}
