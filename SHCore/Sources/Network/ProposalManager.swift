//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 30.04.23.
//

import Foundation
import Model


public protocol ProposalManagerProtocol {
	func load() async throws -> [Proposal]
}

public class ProposalManager: ProposalManagerProtocol {
	let networkManager: NetworkManagerProtocol
	let jsonDecoder = JSONDecoder()

	public init(networkManager: NetworkManagerProtocol = NetworkManager()) {
		self.networkManager = networkManager
	}

	public func load() async throws -> [Proposal] {
		let data = try await networkManager.perform(url: ApiUrls.proposals.rawValue)

		let decoded = try jsonDecoder.decode([Proposal].self, from: data)

		print(decoded)

		return decoded
	}
}


