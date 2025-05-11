//
//  RankingCarouselView.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI

struct RankingCarouselView: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<10, id: \.self) { index in
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
    RankingCarouselView(title: "이번주 인기작 Top 10")
        .background(Color.black)
}
