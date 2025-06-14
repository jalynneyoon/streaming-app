//
//  FetchKeepWatchingUseCase.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 6/14/25.
//

import Foundation

protocol FetchKeepWatchingUseCase {
    func execute() async throws -> [Program]
}

struct DefaultFetchKeepWatchingUseCase: FetchKeepWatchingUseCase {
    
    private let repository: KeepWatchingProviding
    
    init(repository: KeepWatchingProviding) {
        self.repository = repository
    }
    
    func execute() async throws -> [Program] {
        return try await self.repository.fetchKeepWatching()
    }
}
