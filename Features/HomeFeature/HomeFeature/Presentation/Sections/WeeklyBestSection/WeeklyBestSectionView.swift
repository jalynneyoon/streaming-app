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
            RankingCarouselView(
                title: "이번주 인기작 Top 20",
                programs: viewStore.programs,
                isLoading: viewStore.isLoading
            )
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

#Preview {
    let samplePrograms: [Program] = [
        .init(id: 1, title: "슬기로운 감빵생활", imageString: "https://image.tmdb.org/t/p/original/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg"),
        .init(id: 2, title: "기생충", imageString: "https://image.tmdb.org/t/p/original/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg.jpg"),
        .init(id: 3, title: "나는 솔로", imageString: "https://image.tmdb.org/t/p/original/4iWjGghUj2uyHo2Hyw8NFBvsNGm.jpg.jpg"),
        .init(id: 4, title: "Breaking Bad", imageString: "https://image.tmdb.org/t/p/original/yFHHfHcUgGAxziP1C3lLt0q2T4s.jpg"),
        .init(id: 5, title: "미션임파서블", imageString: "https://image.tmdb.org/t/p/original/dmo6TYuuJgaYinXBPjrgG9mB5od.jpg"),
    ]
    
    WeeklyBestSectionView(
        store: Store(
            initialState: .init(programs: samplePrograms),
            reducer: { WeeklyBestSectionFeature() }
        )
    )
    .background(Color.black)
}
