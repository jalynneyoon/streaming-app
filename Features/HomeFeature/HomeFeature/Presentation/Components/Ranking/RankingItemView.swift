//
//  RankingItemView.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI
import CoreUI

struct RankingItemView: View {
    
    var rank: Int = 0
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            ThumbnailView(badgeType: .exclusive("시리즈")) {
                Rectangle()
                    .fill(.gray)
            }
            .offset(x: 20)
            .padding(.trailing, 20)
            
            Text("\(rank + 1 )")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.5), radius: 2, x: 1, y: 1)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RankingItemView()
        .frame(width: 120.0)
        .background(.black)
}

#Preview(traits: .sizeThatFitsLayout) {
    RankingItemView(rank: 19)
        .frame(width: 120.0)
        .background(.black)
}
