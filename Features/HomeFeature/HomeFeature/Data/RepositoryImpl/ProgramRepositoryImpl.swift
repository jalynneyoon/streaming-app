//
//  ProgramRepositoryImpl.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/22/25.
//

import Foundation
import CoreNetwork
import ComposableArchitecture

final class ProgramRepositoryImpl: WeeklyBestProviding, KeepWatchingProviding {

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
    
    func fetchKeepWatching() async throws -> [Program] {
        
        guard let url = Bundle(for: ProgramRepositoryImpl.self).url(forResource: "keep_watching_dummy", withExtension: "json") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let programs = try decoder.decode(KeepWatchingListDTO.self, from: data)
            return programs.toDomain()
        } catch {
            return []
        }
    }
}
