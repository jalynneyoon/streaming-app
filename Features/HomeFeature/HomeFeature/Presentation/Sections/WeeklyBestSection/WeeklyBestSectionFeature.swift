//
//  WeeklyBestSectionFeature.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/19/25.
//

import Foundation
import ComposableArchitecture
import CoreNetwork

@Reducer
public struct WeeklyBestSectionFeature {
    @Dependency(\.fetchWeeklyBestUseCase) var fetchUseCase

    public struct State: Equatable {
        var programs: [Program] = []
        var isLoading: Bool = false
        var error: String?
    }

    public enum Action {
        case onAppear
        case fetchProgramsResponse(Result<[Program], APIError>)

    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .onAppear:
            state.isLoading = true
            
            return .run { send in
                do {
                    let programs = try await fetchUseCase.execute()
                    await send(.fetchProgramsResponse(.success(programs)))
                } catch {
                    // Handle error
                }
            }
        case let .fetchProgramsResponse(.success(programs)):
            state.isLoading = false
            state.programs = programs
            state.error = nil
            return .none
        case let .fetchProgramsResponse(.failure(error)):
            state.isLoading = false
            state.error = error.localizedDescription
            return .none
        }
     }
}
