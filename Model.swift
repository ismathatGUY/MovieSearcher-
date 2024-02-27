//
//  Model.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

import Foundation

struct Movie: Decodable, Hashable {
    var title: String
    var year: String
    var rated: String
    var released: String
    var runtime: String
    var genre: String
    var director: String
    var actors: String
    var plot: String

    // New properties
    var language: String
    var country: String
    var poster: String

    // Existing properties
    var isSavedForLater: Bool = false
    var userRating: Int? = nil

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        
        // New coding keys
        case language = "Language"
        case country = "Country"
        case poster = "Poster"
    }
}
