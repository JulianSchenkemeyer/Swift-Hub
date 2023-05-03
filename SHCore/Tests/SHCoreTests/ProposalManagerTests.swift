//
//  File.swift
//  
//
//  Created by Julian Schenkemeyer on 30.04.23.
//

import XCTest
@testable import Network
@testable import Model


final class ProposalManagerTests: XCTestCase {

	func testLoadingProposalsFromInvalidUrl() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: NetworkError.InvalidUrl)
		let proposalManager = ProposalManager(networkManager: networkManagerMock)

		do {
			_ = try await proposalManager.load()
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidUrl)
		}
	}

	func testLoadingProposalsWithInvalidResponse() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: NetworkError.InvalidResponse)
		let proposalManager = ProposalManager(networkManager: networkManagerMock)

		do {
			_ = try await proposalManager.load()
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidResponse)
		}
	}

	func testLoadingProposalsWithInvalidData() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: NetworkError.InvalidData)
		let proposalManager = ProposalManager(networkManager: networkManagerMock)

		do {
			_ = try await proposalManager.load()
		} catch {
			XCTAssertEqual(error as! NetworkError, NetworkError.InvalidData)
		}
	}

	func testLoadingProposalsWithUnparsableProposal() async throws {
		let networkManagerMock = NetworkManagerMock(data: Data(), error: nil)
		let proposalManager = ProposalManager(networkManager: networkManagerMock)

		do {
			_ = try await proposalManager.load()
		} catch {
			XCTAssertNotNil(error)
		}
	}

	func testLoadingProposals() async throws {
		let expectedProposals = [
			Proposal(id: "1", authors: [Person(link: "", name: "Tester")], link: "", reviewManager: Person(link: "", name: "Chuck"), sha: "123", status: Status(state: "In Review", version: "1"), summary: "This is a test proposal", title: "Test Proposal")
		]

		guard let url = Bundle.module.url(forResource: "MockProposals", withExtension: "json") else {
			XCTFail("Could not create json file path")
			return
		}
		guard let data = try? Data(contentsOf: url) else {
			XCTFail("Could not load data")
			return
		}

		let networkManagerMock = NetworkManagerMock(data: data, error: nil)
		let proposalManager = ProposalManager(networkManager: networkManagerMock)

		guard let proposals = try? await proposalManager.load() else {
			XCTFail("Could not create feed from provided data")
			return
		}

		XCTAssertEqual(proposals, expectedProposals)
	}
}
