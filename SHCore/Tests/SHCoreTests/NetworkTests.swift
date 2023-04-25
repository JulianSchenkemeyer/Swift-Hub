//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 24.04.23.
//

import XCTest
@testable import Network

final class NetworkTests: XCTestCase {

	let validHttpResponse = HTTPURLResponse(url: URL(string: "https://www.test.de")!,
											statusCode: 200,
											httpVersion: nil,
											headerFields: nil)
	let invalidHttpResponse = HTTPURLResponse(url: URL(string: "https://www.test.de")!,
											statusCode: 400,
											httpVersion: nil,
											headerFields: nil)

	func testInvalidUrl() async throws {

		let responseMock = URLResponse()
		let urlSessionMock = MockUrlSession(response: responseMock, data: Data())

		let networkManager = NetworkManager(urlSession: urlSessionMock)

		do {
			_ = try await networkManager.perform(url: "")
			XCTFail("Invalid url did not produce expected error")
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidUrl)
		}
	}

	func testInvalidResponse() async throws {
		let urlSessionMock = MockUrlSession(response: invalidHttpResponse!, data: Data())

		let networkManager = NetworkManager(urlSession: urlSessionMock)

		do {
			_ = try await networkManager.perform(url: "https://www.test.de")
			XCTFail("Invalid reponse did not produce expected error")
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidResponse)
		}
	}

	func testValidNetworkCall() async throws {
		let expectedData = "Hello".data(using: .utf8)
		let urlSessionMock = MockUrlSession(response: validHttpResponse!, data: expectedData!)

		let networkManager = NetworkManager(urlSession: urlSessionMock)

		do {
			let data = try await networkManager.perform(url: "https://www.test.de")

			XCTAssertEqual(data, expectedData)
		} catch {
			XCTFail("Valid url did produce unexpected error")
		}
	}
}



