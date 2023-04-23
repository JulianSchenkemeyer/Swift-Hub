//
//  NodeParser.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


protocol NodeParser: ParserDelegate {
	associatedtype Item
	var result: Item? { get }
	var tagName: String { get }
}
