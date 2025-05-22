//
//  WeeklyBestProviding.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/22/25.
//

import Foundation

protocol WeeklyBestProviding {
    func fetchWeeklyBest() async throws -> [Program]
}
