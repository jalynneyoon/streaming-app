//
//  WeeklyBesListDTO+Mapping.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/23/25.
//

import Foundation
import Shared

struct WeeklyBesListDTO: Decodable {
    let results: [WeeklyBestDTO]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([WeeklyBestDTO].self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct WeeklyBestDTO: Decodable {
    let id: Int
//    let backdropPath: String?
    let originalTitle: String?
//    let adult: Bool
//    let mediaType: String
//    let genreIds: [Int]
//    let voteAverage: Double
//    let popularity: Double
    let posterPath: String?
//    let overview: String
//    let originalLanguage: String
//    let voteCount: Int
//    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
//        case id, adult, originalTitle, mediaType, genreIds, voteAverage, popularity, posterPath, title, overview, originalLanguage, voteCount, releaseDate
        case originalTitle = "original_title"
        case id, title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
//        self.adult = try container.decode(Bool.self, forKey: .adult)
        self.originalTitle = try? container.decode(String.self, forKey: .originalTitle)
//        self.mediaType = try container.decode(String.self, forKey: .mediaType)
//        self.genreIds = try container.decode([Int].self, forKey: .genreIds)
//        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
//        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.posterPath = try? container.decode(String.self, forKey: .posterPath)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.overview = try container.decode(String.self, forKey: .overview)
//        self.originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
//        self.voteCount = try container.decode(Int.self, forKey: .voteCount)
//        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
//        self.backdropPath = try? container.decodeIfPresent(String.self, forKey: .backdropPath)
    }
}

// MARK: - Mapping
extension WeeklyBesListDTO {
    func toDomain() -> [Program] {
        return results.map { $0.toDomain() }
    }
}

extension WeeklyBestDTO {
    func toDomain() -> Program {
        return Program(
            id: id,
            title: originalTitle ?? "",
            imageString: getImagePath()
        )
    }
    
    private func getImagePath() -> String? {
        guard let path = self.posterPath else { return nil }
        let baseURL = "https://image.tmdb.org/t/p"
        let size = "original" // 또는 "original", "w780", "w154" 등
        return [baseURL, size, path].joined(separator: "/")
    }
}

/*
 {
   "results" : [
     {
       "id" : 1098006,
       "backdrop_path" : "\/esKev4tSgF30FDTTZ30594IPOFL.jpg",
       "adult" : false,
       "original_title" : "Fountain of Youth",
       "media_type" : "movie",
       "genre_ids" : [
         12,
         14,
         9648
       ],
       "vote_average" : 7.7000000000000002,
       "popularity" : 10.6769,
       "poster_path" : "\/4iWjGghUj2uyHo2Hyw8NFBvsNGm.jpg",
       "title" : "Fountain of Youth",
       "overview" : "A treasure-hunting mastermind assembles a team for a life-changing adventure. But to outwit and outrun threats at every turn, he'll need someone even smarter than he is: his estranged sister.",
       "original_language" : "en",
       "vote_count" : 6,
       "release_date" : "2025-05-19",
       "video" : false
     },
     {
       "id" : 1232546,
       "backdrop_path" : "\/opSyE1w2QzskFAko0JHtiSrBY6e.jpg",
       "adult" : false,
       "original_title" : "Until Dawn",
       "media_type" : "movie",
       "genre_ids" : [
         27,
         9648
       ],
       "vote_average" : 6.2000000000000002,
       "popularity" : 31.965699999999998,
       "poster_path" : "\/6O9nkcmZBymDXtxOGJmulqcxJdv.jpg",
       "title" : "Until Dawn",
       "overview" : "One year after her sister Melanie mysteriously disappeared, Clover and her friends head into the remote valley where she vanished in search of answers. Exploring an abandoned visitor center, they find themselves stalked by a masked killer and horrifically murdered one by one...only to wake up and find themselves back at the beginning of the same evening.",
       "original_language" : "en",
       "vote_count" : 191,
       "release_date" : "2025-04-23",
       "video" : false
     },
     {
       "id" : 1001414,
       "backdrop_path" : "\/qspghhpOyaBGgZDJoCbV2o9WNMU.jpg",
       "adult" : false,
       "original_title" : "Fear Street: Prom Queen",
       "media_type" : "movie",
       "genre_ids" : [
         27,
         53
       ],
       "vote_average" : 4.5,
       "popularity" : 7.2327000000000004,
       "poster_path" : "\/gevScWYkF8l5i9NjFSXo8HfPNyy.jpg",
       "title" : "Fear Street: Prom Queen",
       "overview" : "As students at Shadyside High are preparing for the 1988 prom, the \"It Girls\" are fighting to get support to be voted Prom Queen. As an unusual nominee emerges in the race, some of the other candidates begin to vanish without a trace.",
       "original_language" : "en",
       "vote_count" : 4,
       "release_date" : "2025-05-23",
       "video" : false
     },
     {
       "id" : 574475,
       "backdrop_path" : "\/j0NUh5irX7q2jIRtbLo8TZyRn6y.jpg",
       "adult" : false,
       "original_title" : "Final Destination Bloodlines",
       "media_type" : "movie",
       "genre_ids" : [
         27,
         9648
       ],
       "vote_average" : 7.2000000000000002,
       "popularity" : 528.95830000000001,
       "poster_path" : "\/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg",
       "title" : "Final Destination Bloodlines",
       "overview" : "Plagued by a violent recurring nightmare, college student Stefanie heads home to track down the one person who might be able to break the cycle and save her family from the grisly demise that inevitably awaits them all.",
       "original_language" : "en",
       "vote_count" : 331,
       "release_date" : "2025-05-09",
       "video" : false
     },
     {
       "id" : 575265,
       "backdrop_path" : "\/1p5aI299YBnqrEEvVGJERk2MXXb.jpg",
       "adult" : false,
       "original_title" : "Mission: Impossible - The Final Reckoning",
       "media_type" : "movie",
       "genre_ids" : [
         28,
         12,
         53
       ],
       "vote_average" : 7.0999999999999996,
       "popularity" : 267.74239999999998,
       "poster_path" : "\/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg",
       "title" : "Mission: Impossible - The Final Reckoning",
       "overview" : "Ethan Hunt and the IMF team continue their search for the terrifying AI known as the Entity — which has infiltrated intelligence networks all over the globe — with the world's governments and a mysterious ghost from Ethan's past on their trail. Joined by new allies and armed with the means to shut the Entity down for good, Hunt is in a race against time to prevent the world as we know it from changing forever.",
       "original_language" : "en",
       "vote_count" : 177,
       "release_date" : "2025-05-17",
       "video" : false
     },
     {
       "id" : 241554,
       "backdrop_path" : "\/nn9vM29SKN227zupaOOmaJz5SA0.jpg",
       "adult" : false,
       "genre_ids" : [
         35,
         18,
         10765
       ],
       "media_type" : "tv",
       "origin_country" : [
         "US"
       ],
       "popularity" : 177.68170000000001,
       "poster_path" : "\/mIKfKo2uDk3itzAPYIcSeYr4KtF.jpg",
       "overview" : "In a high-tech future, a rogue security robot secretly gains free will. To stay hidden, it reluctantly joins a new mission protecting scientists on a dangerous planet...even though it just wants to binge soap operas.",
       "first_air_date" : "2025-05-15",
       "original_name" : "Murderbot",
       "original_language" : "en",
       "vote_count" : 46,
       "name" : "Murderbot",
       "vote_average" : 7.5999999999999996
     },
     {
       "id" : 950387,
       "backdrop_path" : "\/2Nti3gYAX513wvhp8IiLL6ZDyOm.jpg",
       "adult" : false,
       "original_title" : "A Minecraft Movie",
       "media_type" : "movie",
       "genre_ids" : [
         10751,
         35,
         12,
         14,
         28
       ],
       "vote_average" : 6.5,
       "popularity" : 700.01660000000004,
       "poster_path" : "\/yFHHfHcUgGAxziP1C3lLt0q2T4s.jpg",
       "title" : "A Minecraft Movie",
       "overview" : "Four misfits find themselves struggling with ordinary problems when they are suddenly pulled through a mysterious portal into the Overworld: a bizarre, cubic wonderland that thrives on imagination. To get back home, they'll have to master this world while embarking on a magical quest with an unexpected, expert crafter, Steve.",
       "original_language" : "en",
       "vote_count" : 1347,
       "release_date" : "2025-03-31",
       "video" : false
     },
     {
       "id" : 100088,
       "backdrop_path" : "\/gKSbTwTvdfJYAJyTNOxlpNoiktH.jpg",
       "adult" : false,
       "genre_ids" : [
         18
       ],
       "media_type" : "tv",
       "origin_country" : [
         "US"
       ],
       "popularity" : 304.63490000000002,
       "poster_path" : "\/dmo6TYuuJgaYinXBPjrgG9mB5od.jpg",
       "overview" : "Twenty years after modern civilization has been destroyed, Joel, a hardened survivor, is hired to smuggle Ellie, a 14-year-old girl, out of an oppressive quarantine zone. What starts as a small job soon becomes a brutal, heartbreaking journey, as they both must traverse the United States and depend on each other for survival.",
       "first_air_date" : "2023-01-15",
       "original_name" : "The Last of Us",
       "original_language" : "en",
       "vote_count" : 5992,
       "name" : "The Last of Us",
       "vote_average" : 8.5640000000000001
     },
     {
       "id" : 91097,
       "backdrop_path" : "\/k6Yg53yBdsfZeRLJh0WgrG2P11f.jpg",
       "adult" : false,
       "genre_ids" : [
         16,
         10765,
         10759,
         18,
         9648
       ],
       "media_type" : "tv",
       "origin_country" : [
         "CN"
       ],
       "popularity" : 11.2471,
       "poster_path" : "\/e81hXEqhIklX9eCO1ykaYLejvp9.jpg",
       "overview" : "In the near future, human inhabitants would have been crowded and congested. It was an urgency to stride out to the universe and find a new home. When everything was under progress in an orderly way, dramatic geological transformations erupted over the courses of decades. Human beings were raped by this disaster and hardly left anything. Until the nature gradually restored calm, people struggled to their feet from ruins and abysses, stepping again onto this familiar but strange earth. But for us people, dominating everything has been rooted into our blood. Are we still masters of this new world?",
       "first_air_date" : "2019-07-13",
       "original_name" : "灵笼",
       "original_language" : "zh",
       "vote_count" : 52,
       "name" : "Ling Cage: Incarnation",
       "vote_average" : 8.423
     },
     {
       "id" : 552524,
       "backdrop_path" : "\/7Zx3wDG5bBtcfk8lcnCWDOLM4Y4.jpg",
       "adult" : false,
       "original_title" : "Lilo & Stitch",
       "media_type" : "movie",
       "genre_ids" : [
         10751,
         35,
         878
       ],
       "vote_average" : 7.2000000000000002,
       "popularity" : 205.75919999999999,
       "poster_path" : "\/tUae3mefrDVTgm5mRzqWnZK6fOP.jpg",
       "title" : "Lilo & Stitch",
       "overview" : "The wildly funny and touching story of a lonely Hawaiian girl and the fugitive alien who helps to mend her broken family.",
       "original_language" : "en",
       "vote_count" : 57,
       "release_date" : "2025-05-17",
       "video" : false
     },
     {
       "id" : 83867,
       "backdrop_path" : "\/kCGwvjpqM1owt9kI4pkYPJWJLvc.jpg",
       "adult" : false,
       "genre_ids" : [
         10765,
         10759,
         18
       ],
       "media_type" : "tv",
       "origin_country" : [
         "US"
       ],
       "popularity" : 119.1267,
       "poster_path" : "\/khZqmwHQicTYoS7Flreb9EddFZC.jpg",
       "overview" : "In an era filled with danger, deception and intrigue, Cassian Andor will discover the difference he can make in the struggle against the tyrannical Galactic Empire. He embarks on a path that is destined to turn him into a rebel hero.",
       "first_air_date" : "2022-09-21",
       "original_name" : "Andor",
       "original_language" : "en",
       "vote_count" : 1503,
       "name" : "Andor",
       "vote_average" : 8.1999999999999993
     },
     {
       "id" : 86831,
       "backdrop_path" : "\/nBrkOZyI75artyizuBFeya48KbO.jpg",
       "adult" : false,
       "genre_ids" : [
         16,
         10765
       ],
       "media_type" : "tv",
       "origin_country" : [
         "US"
       ],
       "popularity" : 93.507300000000001,
       "poster_path" : "\/asDqvkE66EegtKJJXIRhBJPxscr.jpg",
       "overview" : "Terrifying creatures, wicked surprises and dark comedy converge in this NSFW anthology of animated stories presented by Tim Miller and David Fincher.",
       "first_air_date" : "2019-03-15",
       "original_name" : "Love, Death & Robots",
       "original_language" : "en",
       "vote_count" : 3532,
       "name" : "Love, Death & Robots",
       "vote_average" : 8.2390000000000008
     },
     {
       "id" : 117648,
       "backdrop_path" : "\/jRI3mFtozHlo6CNSw1943w5OBqX.jpg",
       "adult" : false,
       "genre_ids" : [
         10764,
         35
       ],
       "media_type" : "tv",
       "origin_country" : [
         "GB"
       ],
       "popularity" : 27.8322,
       "poster_path" : "\/yKc3FqwD2eanWBUwqcRH7bChE3V.jpg",
       "overview" : "Follow Jeremy Clarkson as he embarks on his latest adventure, farming. The man who on several occasions claims to be allergic to manual labour takes on the most manually labour intensive job there is. What could possibly go wrong?",
       "first_air_date" : "2021-06-11",
       "original_name" : "Clarkson's Farm",
       "original_language" : "en",
       "vote_count" : 306,
       "name" : "Clarkson's Farm",
       "vote_average" : 8.4000000000000004
     },
     {
       "id" : 88989,
       "backdrop_path" : "\/RzCw9LQyAcoa9mn4xkEAyuvhgr.jpg",
       "adult" : false,
       "genre_ids" : [
         18,
         9648
       ],
       "media_type" : "tv",
       "origin_country" : [
         "US"
       ],
       "popularity" : 29.591799999999999,
       "poster_path" : "\/oPcqsZIFHrv7HoGgFQnsGDiPulD.jpg",
       "overview" : "At a boutique health-and-wellness resort that promises healing and transformation, nine stressed city dwellers try to get on a path to a better way of living. Watching over them during this 10-day retreat is the resort's director, Masha, a woman on a mission to reinvigorate their tired minds and bodies. However, these nine \"perfect\" strangers have no idea what is about to hit them.",
       "first_air_date" : "2021-08-18",
       "original_name" : "Nine Perfect Strangers",
       "original_language" : "en",
       "vote_count" : 496,
       "name" : "Nine Perfect Strangers",
       "vote_average" : 6.9989999999999997
     },
     {
       "id" : 1233413,
       "backdrop_path" : "\/nAxGnGHOsfzufThz20zgmRwKur3.jpg",
       "adult" : false,
       "original_title" : "Sinners",
       "media_type" : "movie",
       "genre_ids" : [
         27,
         53
       ],
       "vote_average" : 7.5700000000000003,
       "popularity" : 115.2351,
       "poster_path" : "\/jYfMTSiFFK7ffbY2lay4zyvTkEk.jpg",
       "title" : "Sinners",
       "overview" : "Trying to leave their troubled lives behind, twin brothers return to their hometown to start again, only to discover that an even greater evil is waiting to welcome them back.",
       "original_language" : "en",
       "vote_count" : 754,
       "release_date" : "2025-04-16",
       "video" : false
     },
     {
       "id" : 1197306,
       "backdrop_path" : "\/fTrQsdMS2MUw00RnzH0r3JWHhts.jpg",
       "adult" : false,
       "original_title" : "A Working Man",
       "media_type" : "movie",
       "genre_ids" : [
         28,
         80,
         53
       ],
       "vote_average" : 6.6539999999999999,
       "popularity" : 308.22039999999998,
       "poster_path" : "\/6FRFIogh3zFnVWn7Z6zcYnIbRcX.jpg",
       "title" : "A Working Man",
       "overview" : "Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss's daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.",
       "original_language" : "en",
       "vote_count" : 900,
       "release_date" : "2025-03-26",
       "video" : false
     },
     {
       "id" : 447273,
       "backdrop_path" : "\/tyfO9jHgkhypUFizRVYD0bytPjP.jpg",
       "adult" : false,
       "original_title" : "Snow White",
       "media_type" : "movie",
       "genre_ids" : [
         10751,
         14
       ],
       "vote_average" : 4.3159999999999998,
       "popularity" : 273.46460000000002,
       "poster_path" : "\/oLxWocqheC8XbXbxqJ3x422j9PW.jpg",
       "title" : "Snow White",
       "overview" : "Following the benevolent King's disappearance, the Evil Queen dominated the once fair land with a cruel streak. Princess Snow White flees the castle when the Queen, in her jealousy over Snow White's inner beauty, tries to kill her. Deep into the dark woods, she stumbles upon seven magical dwarves and a young bandit named Jonathan. Together, they strive to survive the Queen's relentless pursuit and aspire to take back the kingdom.",
       "original_language" : "en",
       "vote_count" : 903,
       "release_date" : "2025-03-12",
       "video" : false
     },
     {
       "id" : 896536,
       "backdrop_path" : "\/dJ1JpHuTCRxtGpRq8bQzk2jBqTi.jpg",
       "adult" : false,
       "original_title" : "The Legend of Ochi",
       "media_type" : "movie",
       "genre_ids" : [
         14,
         12,
         10751
       ],
       "vote_average" : 6,
       "popularity" : 120.7911,
       "poster_path" : "\/wVujUVvY4qvKARAslItQ4ARKqtz.jpg",
       "title" : "The Legend of Ochi",
       "overview" : "In a remote village on the island of Carpathia, a shy farm girl named Yuri is raised to fear an elusive animal species known as ochi. But when Yuri discovers a wounded baby ochi has been left behind, she escapes on a quest to bring him home.",
       "original_language" : "en",
       "vote_count" : 53,
       "release_date" : "2025-04-18",
       "video" : false
     },
     {
       "id" : 227191,
       "backdrop_path" : "\/tJSAxxjCtbtZYMBQkfxvdgqXsz5.jpg",
       "adult" : false,
       "genre_ids" : [
         80,
         9648,
         18
       ],
       "media_type" : "tv",
       "origin_country" : [
         "KR"
       ],
       "popularity" : 56.196399999999997,
       "poster_path" : "\/eQWEWCOg5LZLu2AihfMueiHGw1Y.jpg",
       "overview" : "Ten years ago, Yoon Ena came home to a nightmare - her uncle murdered and a lone puzzle piece by his side. With no memory of how she got there, she immediately became Detective Hansaem's prime suspect. Driven to uncover the truth, she becomes a criminal profiler to find out if she really was responsible.",
       "first_air_date" : "2025-05-21",
       "original_name" : "나인 퍼즐",
       "original_language" : "ko",
       "vote_count" : 4,
       "name" : "Nine Puzzles",
       "vote_average" : 7.5
     },
     {
       "id" : 986056,
       "backdrop_path" : "\/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg",
       "adult" : false,
       "original_title" : "Thunderbolts*",
       "media_type" : "movie",
       "genre_ids" : [
         28,
         878,
         12
       ],
       "vote_average" : 7.4690000000000003,
       "popularity" : 163.71000000000001,
       "poster_path" : "\/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg",
       "title" : "Thunderbolts*",
       "overview" : "After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.",
       "original_language" : "en",
       "vote_count" : 950,
       "release_date" : "2025-04-30",
       "video" : false
     }
   ],
   "total_pages" : 500,
   "total_results" : 10000,
   "page" : 1
 }
 */
