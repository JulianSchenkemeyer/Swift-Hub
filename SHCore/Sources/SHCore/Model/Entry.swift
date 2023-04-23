//
//  Entry.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


public struct Entry: CustomStringConvertible {
	let title: String
	let link: String
	let updated: String
	let id: String
	let content: String


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
