//
//  DataCoreGames.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 11/10/22.
//

import UIKit

struct DataCoreGames: Codable {
    var id: Int?
    var name: String?
    var playtime: Int? = 0
    var released: String?
    var background_image: String?
    var rating: Double? = 0.0
}
