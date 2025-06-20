//
//  KeepWatchingSectionView.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 6/20/25.
//

import SwiftUI
import CoreUI
import ComposableArchitecture

struct KeepWatchingSectionView: View {
    
    let store: StoreOf<KeepWatchingSectionFeature>
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 10) {
                
                Text("시청 중인 콘텐츠")
                    .font(.system(size: 18, weight: .bold))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(viewStore.programs, id: \.id) { program in
                            
                            ThumbnailView(
                                ratio: .landscape,
                                badgeType: .none) {
                                    KFImageView(urlString: program.imageString) {
                                        Text(program.title)
                                            .foregroundStyle(Color.white)
                                    }
                                }
                                .frame(width: screenWidth / 2 - 30)
                            
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .frame(height: 150)
                
            }
            .padding([.top, .bottom], 20)
            
        }
    }
}

#Preview {
    let samplePrograms: [Program] = [
        .init(id: 1, title: "슬기로운 감빵생활", imageString: "https://image.tmdb.org/t/p/original//6van4BavoNXaZhCPdzLHNQ4Uc8H.jpg"),
        .init(id: 2, title: "기생충", imageString: "https://image.tmdb.org/t/p/original/a3F9cXjRH488qcOqFmFZwqawBMU.jpg"),
        .init(id: 3, title: "나는 솔로", imageString: "https://image.tmdb.org/t/p/original/uIpJPDNFoeX0TVml9smPrs9KUVx.jpg"),
        .init(id: 4, title: "Breaking Bad", imageString: "https://image.tmdb.org/t/p/original/5z314zU4iraY1ZhbIvgfpbMRVA7.jpg"),
        .init(id: 5, title: "미션임파서블", imageString: "https://image.tmdb.org/t/p/original/lOje1iz4VYWELYWRkZAwI7oIJd0.jpg"),
    ]
    
    KeepWatchingSectionView(
        store: Store(
            initialState: .init(programs: samplePrograms), reducer: { KeepWatchingSectionFeature() }
        )
    )
    .background(Color.black)
}
