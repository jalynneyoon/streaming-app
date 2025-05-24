//
//  FetchWeeklyBestUseCaseTests.swift
//  HomeFeatureTests
//
//  Created by JohyeonYoon on 5/24/25.
//

import XCTest
@testable import HomeFeature
@testable import CoreNetwork

final class FetchWeeklyBestUseCaseTests: XCTestCase {
    
    private var useCase: FetchWeeklyBestUseCase!
    private var repository: MockWeeklyBestProviding!

    override func setUpWithError() throws {
        self.repository = MockWeeklyBestProviding()
        self.useCase = DefaultFetchWeeklyBestUseCase(repository: repository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_execute_success() async throws {
        // given
        let programs = [
            Program(id: 1, title: "Program 1", imageString: "image1.jpg"),
            Program(id: 2, title: "Program 2", imageString: "image2.jpg"),
            Program(id: 3, title: "Program 3", imageString: nil)
        ]
        
        self.repository.resultToReturn = .success(programs)
        
        // when
        let result = try await useCase.execute()
        
        // then
        XCTAssertEqual(result.count, 2)
    }
    
    func test_execute_failure() async throws {
        // given
        self.repository.resultToReturn = .failure(APIError.notConnectedToNetwork)
        
        // when
        do {
            _ = try await useCase.execute()
            XCTFail("Expected to throw an error, but did not.")
        } catch {
            // then
            XCTAssertEqual(error as? APIError, APIError.notConnectedToNetwork)
        }
    }
}
