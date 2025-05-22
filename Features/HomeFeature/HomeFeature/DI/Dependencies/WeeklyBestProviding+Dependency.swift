//
//  WeeklyBestProviding+Dependency.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/22/25.
//

import Foundation
import ComposableArchitecture

extension DependencyValues {
    var weeklyBestRepo: WeeklyBestProviding {
        get { self[WeeklyBestRepoKey.self] }
        set { self[WeeklyBestRepoKey.self] = newValue }
    }
}

private enum WeeklyBestRepoKey: DependencyKey {
    static let liveValue: WeeklyBestProviding = ProgramRepositoryImpl(
        tmdbAPIKey: DependencyValues().tmdbAPIKey,
        dataTransferService: DependencyValues().dataTransferService
    )
}
