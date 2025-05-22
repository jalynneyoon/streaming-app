//
//  FetchWeeklyBestUseCase.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/22/25.
//

import Foundation

protocol FetchWeeklyBestUseCase {
    func execute() async throws -> [Program]
    
}

struct DefaultFetchWeeklyBestUseCase: FetchWeeklyBestUseCase {
    
    private let repository: WeeklyBestProviding
    
    init(repository: WeeklyBestProviding) {
        self.repository = repository
    }
    
    func execute() async throws -> [Program] {
        return try await self.repository.fetchWeeklyBest()
    }
}
