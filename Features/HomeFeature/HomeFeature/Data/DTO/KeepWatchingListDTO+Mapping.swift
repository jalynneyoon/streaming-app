//
//  KeepWatchingListDTO+Mapping.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 6/14/25.
//

import Foundation

struct KeepWatchingListDTO: Decodable {
    let results: [KeepWatchingDTO]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([KeepWatchingDTO].self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct KeepWatchingDTO: Decodable {
    let id: Int
    let originalTitle: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case id, title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.originalTitle = try? container.decode(String.self, forKey: .originalTitle)

        self.backdropPath = try? container.decode(String.self, forKey: .backdropPath)

    }
}

// MARK: - Mapping
extension KeepWatchingListDTO {
    func toDomain() -> [Program] {
        return results.map { $0.toDomain() }
    }
}

extension KeepWatchingDTO {
    func toDomain() -> Program {
        return Program(
            id: id,
            title: originalTitle ?? "",
            imageString: getImagePath()
        )
    }
    
    private func getImagePath() -> String? {
        guard let path = self.backdropPath else { return nil }
        let baseURL = "https://image.tmdb.org/t/p"
        let size = "original" // 또는 "original", "w780", "w154" 등
        return [baseURL, size, path].joined(separator: "/")
    }
}
