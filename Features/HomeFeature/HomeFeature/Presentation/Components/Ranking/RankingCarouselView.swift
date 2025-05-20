//
//  RankingCarouselView.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI

struct RankingCarouselView: View {
    var title: String
    var programs: [Program] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    
                    ForEach(Array(programs.enumerated()), id: \.element.id) {  index, program in
                        RankingItemView(rank: index)
                            .frame(width: 120.0)
                    }
                }
            }
        }
        .padding([.top, .bottom], 20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    var samplePrograms: [Program] = [
        .init(id: "1", title: "슬기로운 감빵생활"),
        .init(id: "2", title: "기생충"),
        .init(id: "3", title: "나는 솔로"),
        .init(id: "4", title: "Breaking Bad"),
        .init(id: "5", title: "미션임파서블"),
    ]
    
    RankingCarouselView(
        title: "이번주 인기작 Top 10",
        programs: samplePrograms
    )

    .background(Color.black)
}
