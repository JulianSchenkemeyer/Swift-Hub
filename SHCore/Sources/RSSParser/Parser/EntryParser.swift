//
//  EntryParser.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation
import Model


class EntryParser: NSObject, NodeParser {
	var delegateStack: ParserDelegateStack?
	var tagName = "entry"

	private var title: String?
	private var link: String?
	private var updated: String?
	private var id: String?
	private var content: String?

	private var currentElement = ""
	private var contentParser = ContentParser()

	var result: Entry?

	func didBecomeActive() {
		guard let content = contentParser.result else { return }
		self.content = content
		contentParser.result = nil
	}

	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		print("entry parser: -- \(currentElement)")
		currentElement = elementName

		if currentElement == contentParser.tagName {
			delegateStack?.push(parser: contentParser)
			contentParser.parser(parser, didStartElement: elementName, namespaceURI: namespaceURI, qualifiedName: qName, attributes: attributeDict)
		}

	}

	func parser(_ parser: XMLParser, foundCharacters string: String) {
		switch currentElement {
		case "title":
			self.title = string
		case "link":
			self.link = string
		case "updated":
			self.updated = string
		case "id":
			self.id = string
		default:
			break
		}
	}

	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		currentElement = ""

		if elementName == tagName {
			result = Entry(title: title ?? "",
						   link: link ?? "",
						   updated: updated ?? "",
						   id: id ?? "",
						   content: content ?? "")
			delegateStack?.pop()
		}
	}
}
