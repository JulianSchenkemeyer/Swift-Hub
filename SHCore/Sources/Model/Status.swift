//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 03.05.23.
//

import Foundation


public struct Status: Decodable, Equatable {
	public let state: String
	public let version: String
}
