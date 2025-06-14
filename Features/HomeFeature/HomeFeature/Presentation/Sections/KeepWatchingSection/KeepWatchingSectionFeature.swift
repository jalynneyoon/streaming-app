//
//  KeepWatchingSectionFeature.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 6/14/25.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct KeepWatchingSectionFeature {
    @Dependency(\.fetchKeepWatchingUseCase) var fetchUseCase

    public struct State: Equatable {
        var programs: [Program] = []
    }

    public enum Action {
        case fetchKeepWatching
        case keepWatchingResponse(Result<[Program], Error>)
    }


    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
       
            switch action {
            case .fetchKeepWatching:
                return .run { send in
                    do {
                        let programs = try await fetchUseCase.execute()
                        await send(.keepWatchingResponse(.success(programs)))
                    } catch {
                        // Handle error
                    }
                }
                
            case let .keepWatchingResponse(result):
                switch result {
                case let .success(programs):
                    state.programs = programs
                case .failure:
                    break // Handle error if needed
                }
                return .none
            }
        
    }
}
