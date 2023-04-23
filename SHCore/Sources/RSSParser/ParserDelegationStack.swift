//
//  ParserDelegationStatck.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


class ParserDelegateStack {
	private var parsers: [ParserDelegate] = []
	private let xmlParser: XMLParser

	init(xmlParser: XMLParser) {
		self.xmlParser = xmlParser
	}

	func push(parser: ParserDelegate) {
		parser.delegateStack = self
		xmlParser.delegate = parser
		parsers.append(parser)
	}

	func pop() {
		parsers.removeLast()
		if let next = parsers.last {
			xmlParser.delegate = next
			next.didBecomeActive()
		} else {
			xmlParser.delegate = nil
		}
	}
}
