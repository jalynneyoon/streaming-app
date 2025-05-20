//
//  WeeklyBestSectionView.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/21/25.
//

import SwiftUI
import ComposableArchitecture

struct WeeklyBestSectionView: View {
    let store: StoreOf<WeeklyBestSectionFeature>
    var body: some View {
        WithViewStore(store, observe: { $0 } ) { viewStore in
            RankingCarouselView(title: "이번주 인기작 Top 10", programs: viewStore.programs)
        }
    }
}

#Preview {
    var samplePrograms: [Program] = [
        .init(id: "1", title: "슬기로운 감빵생활"),
        .init(id: "2", title: "기생충"),
        .init(id: "3", title: "나는 솔로"),
        .init(id: "4", title: "Breaking Bad"),
        .init(id: "5", title: "미션임파서블"),
    ]
    
    WeeklyBestSectionView(
        store: Store(
            initialState: .init(programs: samplePrograms),
            reducer: { WeeklyBestSectionFeature() }
        )
    )
}
