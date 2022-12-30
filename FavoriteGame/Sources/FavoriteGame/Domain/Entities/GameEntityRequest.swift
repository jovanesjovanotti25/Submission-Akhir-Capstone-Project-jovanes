//
//  File.swift
//  
//
//  Created by Jovanes Jovanotti on 30/12/22.
//

import Foundation

public struct GameEntityRequest {
    public var id: Int?
    public var name: String?
    public var playtime: Int?
    public var released: String?
    public var background_image: String?
    public var rating: Double?

    public init(id: Int, name: String, playtime: Int, released: String, background_image: String, rating: Double) {
        self.id = id
        self.name = name
        self.playtime = playtime
        self.released = released
        self.background_image = background_image
        self.rating = rating
    }
}
