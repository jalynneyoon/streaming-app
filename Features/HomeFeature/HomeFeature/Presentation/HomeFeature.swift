//
//  HomeFeature.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import ComposableArchitecture

@Reducer
public struct HomeFeature {
    
    public init() { }
    
    public struct State: Equatable {
        public init() { }
        var weeklyBest = WeeklyBestSectionFeature.State(programs: [])
    }

    public enum Action {
        case weeklyBest(WeeklyBestSectionFeature.Action)
        
    }
    
    public var body: some Reducer<State, Action> {
        Scope(state: \.weeklyBest, action: \.weeklyBest) {
            WeeklyBestSectionFeature()
        }
    }
}

