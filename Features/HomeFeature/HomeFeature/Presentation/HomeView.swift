//
//  HomeView.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/11/25.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let state: HomeFeature.State
    
    init(state: HomeFeature.State) {
        self.state = state
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HomeView(state: .init())

}
