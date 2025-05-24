//
//  MockWeeklyBestProviding.swift
//  HomeFeatureTests
//
//  Created by JohyeonYoon on 5/24/25.
//

import Foundation
@testable import HomeFeature

final class MockWeeklyBestProviding: WeeklyBestProviding {
    var fetchCalled: Bool = false
    var resultToReturn: Result<[Program], Error> = .success([])

    func fetchWeeklyBest() async throws -> [Program] {
        self.fetchCalled = true
        
        switch resultToReturn {
        case .success(let programs):
            return programs
        case .failure(let error):
            throw error
        }
    }
}
