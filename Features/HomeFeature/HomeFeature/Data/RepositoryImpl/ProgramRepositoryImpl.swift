//
//  ProgramRepositoryImpl.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/22/25.
//

import Foundation
import CoreNetwork
import ComposableArchitecture

final class ProgramRepositoryImpl: WeeklyBestProviding {

    private let tmdbAPIKey: String
    private let dataTransferService: DataTransferService
    
    init(tmdbAPIKey: String,
         dataTransferService: DataTransferService) {
        self.tmdbAPIKey = tmdbAPIKey
        self.dataTransferService = dataTransferService
    }
    
    func fetchWeeklyBest() async throws -> [Program] {
        let request = HttpRequest(
            baseURL: "https://api.themoviedb.org/3/trending/all/week",
            headerParameters: ["Authorization" : "Bearer " + (tmdbAPIKey)],
            method: .get,
            queryParameters: [:]
        )
        
        let result: Result<WeeklyBesListDTO, APIError> = await self.dataTransferService.request(with: request)
        switch result {
        case .success(let response):
            return response.toDomain()
        case .failure(let error):
            throw error
        }
    }
}
