//
//  DetailGame.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit
import Game

public struct DetailGame: Codable {
    public var id: Int?
    public var name: String?
    public var description_raw: String?
    public var playtime: Int? = 0
    public var released: String?
    public var background_image: String?
    public var rating: Double? = 0.0
    public var rating_top: Int? = 5
    public var ratings: [Rating]?
    public var suggestions_count: Int?
    public var reviews_count: Int? = 0
    public var genres: [Genre]?
    public var developers: [Developer]?
    public var publishers: [Publisher]?
}

public struct Rating: Codable {
    public var id: Int?
    public var title: String?
    public var count: Int?
    public var percent: Double?
}

public struct Developer: Codable {
    public var id: Int?
    public var name: String?
}

public struct Publisher: Codable {
    public var id: Int?
    public var name: String?
}
