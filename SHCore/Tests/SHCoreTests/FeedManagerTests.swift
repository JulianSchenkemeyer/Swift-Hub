//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 24.04.23.
//

import XCTest
@testable import Network
@testable import Model

final class FeedManagerTests: XCTestCase {

	func testLoadingFeedFromInvalidUrl() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: NetworkError.InvalidUrl)

		let feedManager = FeedManager(networkManager: networkManagerMock)

		do {
			_ = try await feedManager.load()
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidUrl)
		}
	}

	func testLoadingFeedWithInvalidResponse() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: NetworkError.InvalidResponse)

		let feedManager = FeedManager(networkManager: networkManagerMock)

		do {
			_ = try await feedManager.load()
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidResponse)
		}
	}

	func testLoadingFeedWithInvalidData() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: NetworkError.InvalidData)

		let feedManager = FeedManager(networkManager: networkManagerMock)

		do {
			_ = try await feedManager.load()
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidData)
		}
	}

	func testLoadingFeedWithUnparsableFeed() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: nil)
		let feedManager = FeedManager(networkManager: networkManagerMock)

		do {
			_ = try await feedManager.load()
		} catch {
			XCTAssertNotNil(error)
		}
	}

	func testLoadingFeed() async throws {
		let expectedFeed = Feed(title: "Test Blog",
								updated: "2023-03-25T05:59:40-04:00",
								id: "tag:Test Blog,2015-12-03:Swift",
								entries: [
									Entry(title: "The Test Blog",
										  link: "",
										  updated: "2015-12-03T06:01:01-04:00",
										  id: "TestBlog/welcome/",
										  content: "<p>Welcome to the blog on Test Blog!</p>")
								])

		guard let data = MockData.rssFeedOneEntry.data(using: .utf8) else {
			XCTFail("Cannot create data")
			return
		}

		let networkManagerMock = NetworkManagerMock(data: data, error: nil)
		let feedManager = FeedManager(networkManager: networkManagerMock)

		guard let feed = try? await feedManager.load() else {
			XCTFail("Could not create feed from provided data")
			return
		}

		XCTAssertEqual(feed, expectedFeed)
	}
}

class NetworkManagerMock: NetworkManagerProtocol {

	let data: Data
	let error: NetworkError?

	init(data: Data, error: NetworkError?) {
		self.data = data
		self.error = error
	}

	func perform(url: String) async throws -> Data {
		if let error {
			throw error
		}

		return data
	}
}
