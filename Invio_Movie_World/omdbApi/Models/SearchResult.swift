//
//  MovieShortInfo.swift
//  Invio_Movie_World
//
//  Created by MAC on 23.10.2022.
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
}
