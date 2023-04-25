//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 24.04.23.
//

import Foundation

public protocol URLSessionProtocol {
	func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
