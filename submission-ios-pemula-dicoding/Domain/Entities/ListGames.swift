//
//  ListGames.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 05/10/22.
//

import UIKit

struct ListGamesResponse: Codable {
    var results: [ListGames]?
}

struct ListGames: Codable {
    var id: Int?
    var name: String?
    var released: String?
    var background_image: String?
    var rating: Double? = 0.0
    var ratings_count: Int?
    var metacritic: Int? = 0
    var playtime: Int?
    var genres: [Genre]?
    var short_screenshots: [shortScreenshots]?
}

struct Genre: Codable {
    var id: Int?
    var name: String?
}

struct shortScreenshots: Codable {
    var id: Int?
    var image: String?
}
