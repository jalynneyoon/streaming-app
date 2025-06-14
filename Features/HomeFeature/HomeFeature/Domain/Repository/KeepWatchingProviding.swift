//
//  KeepWatchingProviding.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 6/14/25.
//

import Foundation

protocol KeepWatchingProviding {
    func fetchKeepWatching() async throws -> [Program]
}
