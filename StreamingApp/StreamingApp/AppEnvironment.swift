//
//  AppEnvironment.swift
//  CoreEnvironment
//
//  Created by JohyeonYoon on 5/20/25.
//

import Foundation

public struct AppEnvironment {
    public var tmdbAPIKey: String
    
    public init(
        tmdbAPIKey: String = Bundle.main.object(forInfoDictionaryKey: "TMDB_API_Access_Token") as? String ?? ""
    ) {
        self.tmdbAPIKey = tmdbAPIKey
    }
}
