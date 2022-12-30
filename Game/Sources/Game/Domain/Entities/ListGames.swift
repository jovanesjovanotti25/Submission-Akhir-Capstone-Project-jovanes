//
//  ListGames.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 05/10/22.
//

import UIKit

public struct ListGamesResponse: Codable {
    public var results: [ListGames]?
}

public struct ListGames: Codable {
    public var id: Int?
    public var name: String?
    public var released: String?
    public var background_image: String?
    public var rating: Double? = 0.0
    public var ratings_count: Int?
    public var metacritic: Int? = 0
    public var playtime: Int?
    public var genres: [Genre]?
    public var short_screenshots: [ShortScreenshots]?
}

public struct Genre: Codable {
    public var id: Int?
    public var name: String?
}

public struct ShortScreenshots: Codable {
    public var id: Int?
    public var image: String?
}
