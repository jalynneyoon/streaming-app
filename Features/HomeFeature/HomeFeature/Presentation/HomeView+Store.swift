//
//  HomeView+Store.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI
import ComposableArchitecture

public struct HomeViewContainer: View {
    let store: StoreOf<HomeFeature>

    public init(store: StoreOf<HomeFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 } ) { viewStore in
            WeeklyBestSectionView(store: store.scope(state: \.weeklyBest, action: \.weeklyBest))
            HomeView(state: viewStore.state)
        }
    }
}
