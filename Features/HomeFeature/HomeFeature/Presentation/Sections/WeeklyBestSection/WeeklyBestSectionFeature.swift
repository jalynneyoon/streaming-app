//
//  WeeklyBestSectionFeature.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/19/25.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct WeeklyBestSectionFeature {
    public struct State: Equatable {
        let programs: [Program]
    }

    public enum Action {
        case fetchWeeklyBest
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchWeeklyBest:
            return .none
        }
    }
}
