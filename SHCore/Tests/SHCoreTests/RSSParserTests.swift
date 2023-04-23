import XCTest
@testable import RSSParser

final class SwiftRSSTests: XCTestCase {
	var xmlSampleData: Data? { MockData.rssFeed.data(using: .utf8) }
	var xmlSampleDataFeedWithoutContent: Data? { MockData.rssFeedWithoutContent.data(using: .utf8) }
	var xmlSampleDataFeedWithOneEntry: Data? { MockData.rssFeedOneEntry.data(using: .utf8) }



	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func testParsing() throws {
		guard let xmlSampleData else {
			XCTFail("Provided XML Data sample is invalid")
			return
		}
		let rssParser = RSSParser(xmlData: xmlSampleData)
		let feed = try? rssParser.parse()

		guard let feed else {
			XCTFail("Feed could not be parsed")
			return
		}

		XCTAssertEqual(feed.title, "Test Blog")
		XCTAssertEqual(feed.updated, "2023-03-25T05:59:40-04:00")
		XCTAssertEqual(feed.id, "tag:Test Blog,2015-12-03:Swift")
		XCTAssertEqual(feed.entries.count, 3)

		for (index, entry) in feed.entries.enumerated() {
			XCTAssertEqual(entry.title, "entry #\(index + 1)")
		}
	}

	func testParsingFeedWithoutEntries() throws {
		guard let xmlSampleDataFeedWithoutContent else {
			XCTFail("Provided XML Data sample is invalid")
			return
		}
		let rssParser = RSSParser(xmlData: xmlSampleDataFeedWithoutContent)
		let feed = try? rssParser.parse()

		guard let feed else {
			XCTFail("Feed could not be parsed")
			return
		}

		XCTAssertEqual(feed.title, "Test Blog")
		XCTAssertEqual(feed.updated, "2023-03-25T05:59:40-04:00")
		XCTAssertEqual(feed.id, "tag:Test Blog,2015-12-03:Swift")
		XCTAssertEqual(feed.entries.count, 0)
	}

	func testParsingFeedWithOneEntries() throws {
		guard let xmlSampleDataFeedWithOneEntry else {
			XCTFail("Provided XML Data sample is invalid")
			return
		}
		let rssParser = RSSParser(xmlData: xmlSampleDataFeedWithOneEntry)
		let feed = try? rssParser.parse()

		guard let feed else {
			XCTFail("Feed could not be parsed")
			return
		}

		XCTAssertEqual(feed.title, "Test Blog")
		XCTAssertEqual(feed.updated, "2023-03-25T05:59:40-04:00")
		XCTAssertEqual(feed.id, "tag:Test Blog,2015-12-03:Swift")
		XCTAssertEqual(feed.entries.count, 1)

		let entry = feed.entries.first!
		XCTAssertEqual(entry.title, "The Test Blog")
		XCTAssertEqual(entry.id, "TestBlog/welcome/")
		XCTAssertEqual(entry.content, "<p>Welcome to the blog on Test Blog!</p>")
	}
}
