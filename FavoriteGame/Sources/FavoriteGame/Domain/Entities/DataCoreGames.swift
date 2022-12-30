//
//  DataCoreGames.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 11/10/22.
//

import UIKit


public struct DataCoreGames: Codable {

    public var id: Int?
    public var name: String?
    public var playtime: Int? = 0
    public var released: String?
    public var background_image: String?
    public var rating: Double? = 0.0

    public init(id: Int?, name: String?, playtime: Int?, released: String?, background_image: String?, rating: Double?){
        self.id = id
        self.name = name
        self.playtime = playtime
        self.released = released
        self.background_image = background_image
        self.rating = rating
    }

//    public var id: Int?
//    public var name: String?
//    public var playtime: Int? = 0
//    public var released: String?
//    public var background_image: String?
//    public var rating: Double? = 0.0
//
//    public init(id: Int?, name: String?, playtime: Int?, released: String?, background_image: String?, rating: Double?){
//        self.id = id
//        self.name = name
//        self.playtime = playtime
//        self.released = released
//        self.background_image = background_image
//        self.rating = rating
//    }
}

//@objc dynamic public var id: Int = 0
//@objc dynamic public var idGame = 0
//@objc dynamic public var name: String? = ""
//@objc dynamic public var playtime = 0
//@objc dynamic public var released: String? = ""
//@objc dynamic public var background_image: String = ""
//@objc dynamic public var rating: Double = 0.0
