//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 27.04.23.
//

import Foundation


public struct Proposal: Decodable, Equatable {
	public let id: String
	public let authors: [Person]
	public let link: String
	public let reviewManager: Person
	public let sha: String
	public let status: Status
	public let summary: String
	public let title: String
}
