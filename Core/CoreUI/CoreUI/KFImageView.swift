//
//  KFImageView.swift
//  CoreUI
//
//  Created by JohyeonYoon on 5/23/25.
//

import SwiftUI
import Kingfisher

public struct KFImageView: View {
    let url: URL?
    let placeholder: Image

    public init(urlString: String?, placeholder: Image = Image(systemName: "photo")) {
        self.url = URL(string: urlString ?? "")
        self.placeholder = placeholder
    }

    public var body: some View {
        KFImage(url)
            .placeholder { placeholder.background(Color.gray) }
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
