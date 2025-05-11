//
//  HomeView+Store.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI
import ComposableArchitecture

struct HomeViewContainer: View {
    let store: StoreOf<HomeFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 } ) { viewStore in
            HomeView(state: viewStore.state)
        }
    }
}
