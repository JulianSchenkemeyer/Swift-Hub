//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 24.04.23.
//

import Foundation
import Network

class MockUrlSession: URLSessionProtocol {
	let response: URLResponse
	let data: Data

	init(response: URLResponse, data: Data) {
		self.response = response
		self.data = data
	}

	func data(from url: URL) async throws -> (Data, URLResponse) {
		return (data, response)
	}
}
