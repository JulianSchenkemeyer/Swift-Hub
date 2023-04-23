//
//  ParserDelegate.swift
//  SwiftRSS
//
//  Created by Julian Schenkemeyer on 30.03.23.
//

import Foundation


protocol ParserDelegate: XMLParserDelegate {
	var delegateStack: ParserDelegateStack? { get set }

	func didBecomeActive()
}

extension ParserDelegate {
	func didBecomeActive() { }
}
