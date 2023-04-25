//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 23.04.23.
//

import Foundation


public protocol NetworkManagerProtocol {
	func perform(url: String) async throws -> Data
}

public class NetworkManager: NetworkManagerProtocol {
	let urlSession: URLSessionProtocol

	public init(urlSession: URLSessionProtocol = URLSession.shared) {
		self.urlSession = urlSession
	}

	public func perform(url: String) async throws -> Data {
		guard let url = URL(string: url) else {
			throw NetworkError.InvalidUrl
		}

		let (data, response) = try await urlSession.data(from: url)
		guard let response = response as? HTTPURLResponse, response.statusCode < 400 else {
			throw NetworkError.InvalidResponse
		}

		return data
	}
}
