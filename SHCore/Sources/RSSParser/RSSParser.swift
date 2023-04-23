//
//  RssParser.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation
import Model


enum RSSParserErrors: String, Error {
	case CouldNotParse = "Unable to parse the provided xml into a feed object"
	case UnknownError = "An unknown error occurred"
}

public class RSSParser {
	var xmlData: Data

	var xmlParser: XMLParser
	var delegationStack: ParserDelegateStack


	public init(xmlData: Data) {
		self.xmlData = xmlData
		self.xmlParser = XMLParser(data: xmlData)
		self.delegationStack = ParserDelegateStack(xmlParser: xmlParser)
	}

	public func parse() throws -> Feed {
		let feedParser = FeedParser()
		delegationStack.push(parser: feedParser)

		if xmlParser.parse() {
			guard let result = feedParser.result else { throw RSSParserErrors.CouldNotParse }

			return result
		} else {
			guard let error = xmlParser.parserError else { throw RSSParserErrors.UnknownError }
			throw error
		}
	}
}
