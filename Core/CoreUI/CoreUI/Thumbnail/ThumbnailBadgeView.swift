//
//  ThumbnailBadgeView.swift
//  CoreUI
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI

public enum BadgeType: Equatable {
    case none
    case normal(String)
    case highlighted(String)
    case exclusive(String)
}

struct ThumbnailBadgeView: View {
    
    let badgeType: BadgeType
    
    init(badgeType: BadgeType) {
        self.badgeType = badgeType
    }
    
    var body: some View {
        ZStack {
            switch badgeType {
            case .none:
                EmptyView()
            case .normal(let text):
                Text(text)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(5)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
            case .highlighted(let text):
                Text(text)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(5)
                    .background(Color.white.opacity(0.7))
                    .foregroundColor(.orange)
            case .exclusive(let text):
                HStack(spacing: 1.0) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.white)
                        .padding(.leading, 5.0)
                    
                    Text(text)
                        .font(.system(size: 12, weight: .semibold))
                        .padding(5)
                        .foregroundColor(.white)
                }
                .background(Color.blue.opacity(0.8))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 4.0))
    }
}


#Preview("normal", traits: .sizeThatFitsLayout) {
    Group {
        ThumbnailBadgeView(badgeType: .normal("매주 업데이트"))
            .padding()
    }
}

#Preview("하이라이트", traits: .sizeThatFitsLayout) {
    ThumbnailBadgeView(badgeType: .highlighted("개별구매"))
        .padding()
}

#Preview("독점", traits: .sizeThatFitsLayout) {
    ThumbnailBadgeView(badgeType: .exclusive("시리즈"))
        .padding()
}

#Preview("없음") {
    ThumbnailBadgeView(badgeType: .none)
}
