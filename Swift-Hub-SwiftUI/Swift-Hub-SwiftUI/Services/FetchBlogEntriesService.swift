//
//  BlogEntryFetcher.swift
//  Swift-Hub-SwiftUI
//
//  Created by Julian Schenkemeyer on 07.05.23.
//

import Foundation
import Network


actor FetchBlogEntriesService {
	private let feedManager: FeedManagerProtocol

	init(feedManager: FeedManagerProtocol = FeedManager()) {
		self.feedManager = feedManager
	}
}

extension FetchBlogEntriesService {
	func fetch() async -> [BlogEntry] {
		do {
			let entries = try await feedManager.load()
			return entries.entries.map { BlogEntry($0) }
		} catch {
			print(error.localizedDescription)
			return []
		}
	}
}
