//
//  RankingCarouselView.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI

struct RankingCarouselView: View {
    let title: String
    let programs: [Program]
    var isLoading: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            if isLoading {
                ProgressView()
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 100)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        
                        ForEach(Array(programs.enumerated()), id: \.element.id) {  index, program in
                            RankingItemView(rank: index, program: program)
                                .frame(width: 120.0)
                        }
                    }
                }
            }
        }
        .padding([.top, .bottom], 20)
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
    
    RankingCarouselView(
        title: "이번주 인기작 Top 10",
        programs: samplePrograms,
        isLoading: false
    )

    .background(Color.black)
}

#Preview {
    let samplePrograms: [Program] = []
    
    RankingCarouselView(
        title: "이번주 인기작 Top 10",
        programs: samplePrograms,
        isLoading: true
    )

    .background(Color.black)
}

