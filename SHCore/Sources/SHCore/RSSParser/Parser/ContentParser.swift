//
//  ContentParser.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


class ContentParser: NSObject, NodeParser {
	var delegateStack: ParserDelegateStack?
	var tagName = "content"

	private var content = ""

	var result: String?

	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		print("content parser active")
		if elementName == tagName { return }

		content += "<\(elementName)>"
	}

	func parser(_ parser: XMLParser, foundCharacters string: String) {
		content += string
	}

	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {

		if elementName == tagName {
			result = content
			content = ""
			delegateStack?.pop()
			return
		}

		content += "</\(elementName)>"
	}
}
