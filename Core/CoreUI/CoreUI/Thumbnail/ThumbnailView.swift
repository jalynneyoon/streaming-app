//
//  ThumbnailView.swift
//  CoreUI
//
//  Created by JohyeonYoon on 5/10/25.
//

import SwiftUI

public enum AspectRatioType {
    /// 가로형 (16:9)
    case landscape
    /// 세로형 일반 (2:3)
    case portrait
    /// 세로형 강조 (9:16)
    case verticalHero
    
    var value: CGFloat {
        switch self {
        case .landscape:
            return 16/9
        case .portrait:
            return 2/3
        case .verticalHero:
            return 9/16
        }
    }
}

public struct ThumbnailView<Content: View>: View {
    
    private var content: () -> Content
    private var ratio: AspectRatioType
    private var badgeView: ThumbnailBadgeView
    
    public init(ratio: AspectRatioType = .portrait,
                badgeType: BadgeType = .none,
                @ViewBuilder _ content: @escaping () -> Content) {
        self.ratio = ratio
        self.badgeView = ThumbnailBadgeView(badgeType: badgeType)
        self.content = content
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            content()
            badgeView
        }
        .aspectRatio(ratio.value, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 6.0))
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThumbnailView(
                ratio: .landscape,
                badgeType: .exclusive("시리즈")) {
                    Rectangle().fill(Color.gray)
                }
                .previewDisplayName("Landscape")
            
            ThumbnailView(
                ratio: .portrait,
                badgeType: .highlighted("세일")) {
                    Rectangle().fill(Color.green)
                }
                .previewDisplayName("Portrait")
            
            ThumbnailView(
                ratio: .verticalHero,
                badgeType: .normal("매주 업데이트")) {
                    Rectangle().fill(Color.brown)
                }
                .previewDisplayName("Vertical Hero")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
