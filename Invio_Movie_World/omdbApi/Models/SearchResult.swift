//
//  MovieShortInfo.swift
//  Invio_Movie_World
//
//  Created by Muammer_Akca on 23.10.2022.
//

import Foundation

// MARK: - SearchResult
struct SearchResult: Codable {
    let search: [MovieShortInfo]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.search = try container.decode([MovieShortInfo].self, forKey: .search)
        self.totalResults = try container.decode(String.self, forKey: .totalResults)
        self.response = try container.decode(String.self, forKey: .response)
    }
}

// MARK: - MovieShortInfo
struct MovieShortInfo: Codable {
    let title, year, imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.year = try container.decode(String.self, forKey: .year)
        self.imdbID = try container.decode(String.self, forKey: .imdbID)
        self.type = try container.decode(String.self, forKey: .type)
        self.poster = try container.decode(String.self, forKey: .poster)
    }
}

