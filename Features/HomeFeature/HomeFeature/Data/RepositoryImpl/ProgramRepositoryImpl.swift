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
        let headers: [String: String] = ["Authorization" : "Bearer " + (tmdbAPIKey)]
        let request = HttpRequest<DTO>(baseURL: "https://api.themoviedb.org/movie", headerParameters: headers, method: .get, queryParameters: [:])
        await self.dataTransferService.request(with: request)
        return []
    }
}

struct DTO: Codable {
    
}
