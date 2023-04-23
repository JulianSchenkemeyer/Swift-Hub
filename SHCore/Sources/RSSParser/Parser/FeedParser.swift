//
//  FeedParser.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation
import Model


class FeedParser: NSObject, NodeParser {
	var delegateStack: ParserDelegateStack?
	var tagName = "feed"

	private var title: String?
	private var updated: String?
	private var id: String?
	private var entries: [Entry] = []

	private var currentElement = ""
	private var entryParser = EntryParser()

	var result: Feed?

	func didBecomeActive() {
		guard let newEntry = entryParser.result else { return }
		entries.append(newEntry)
		entryParser.result = nil
	}

	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		currentElement = elementName

		if currentElement == entryParser.tagName {
			delegateStack?.push(parser: entryParser)
			entryParser.parser(parser, didStartElement: elementName, namespaceURI: namespaceURI, qualifiedName: qName, attributes: attributeDict)
		}
	}

	func parser(_ parser: XMLParser, foundCharacters string: String) {
		switch currentElement {
		case "title":
			title = string
		case "updated":
			updated = string
		case "id":
			id = string
		default:
			break
		}
	}


	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		currentElement = ""

		if elementName == tagName {
			result = Feed(title: title ?? "", updated: updated ?? "", id: id ?? "", entries: entries)
		}
	}
}
