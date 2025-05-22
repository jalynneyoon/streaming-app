//
//  StreamingAppApp.swift
//  StreamingApp
//
//  Created by JohyeonYoon on 5/10/25.
//

import SwiftUI
import HomeFeature
import ComposableArchitecture

@main
struct StreamingAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            HomeViewContainer(
                store: Store(
                    initialState: HomeFeature.State(),
                    reducer: {
                        HomeFeature()
                    }
                )
            )
           
        }
    }
}
