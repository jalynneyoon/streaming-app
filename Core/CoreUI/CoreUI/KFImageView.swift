//
//  KFImageView.swift
//  CoreUI
//
//  Created by JohyeonYoon on 5/23/25.
//

import SwiftUI
import Kingfisher

public struct KFImageView<P: View>: View {
    let url: URL?
    private var placeholder: () -> P
    
    public init(
        urlString: String?,
        @ViewBuilder _ placeholder: @escaping () -> P) {
        self.url = URL(string: urlString ?? "")
        self.placeholder = placeholder
    }
    
    public var body: some View {
        KFImage(url)
            .placeholder {
                placeholder()
                    .background(Color.gray)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
