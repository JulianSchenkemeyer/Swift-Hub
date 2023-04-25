//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 24.04.23.
//

import Foundation
import RSSParser
import Model


public protocol FeedManagerProtocol {
	func load() async throws -> Feed
}

public class FeedManager: FeedManagerProtocol {
	let networkManager: NetworkManagerProtocol

	public init(networkManager: NetworkManagerProtocol = NetworkManager()) {
		self.networkManager = networkManager
	}

	public func load() async throws -> Feed {
		let data = try await networkManager.perform(url: ApiUrls.feed.rawValue)
		let rssParser = RSSParser(xmlData: data)

		let feed = try rssParser.parse()

		print(feed)
		return feed
	}
}
