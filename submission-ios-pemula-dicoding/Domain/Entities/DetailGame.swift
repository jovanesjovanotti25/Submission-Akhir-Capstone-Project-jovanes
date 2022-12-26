//
//  DetailGame.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit


struct DetailGame: Codable {
    var id: Int?
    var name: String?
    var description_raw: String?
    var playtime: Int? = 0
    var released: String?
    var background_image: String?
    var rating: Double? = 0.0
    var rating_top: Int? = 5
    var ratings: [Rating]?
    var suggestions_count: Int?
    var reviews_count: Int? = 0
    var genres: [Genre]?
    var developers: [Developer]?
    var publishers: [Publisher]?
}

struct Rating: Codable {
    var id: Int?
    var title: String?
    var count: Int?
    var percent: Double?
}

struct Developer: Codable {
    var id: Int?
    var name: String?
}

struct Publisher: Codable {
    var id: Int?
    var name: String?
}
