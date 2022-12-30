//
//  File.swift
//  
//
//  Created by Jovanes Jovanotti on 30/12/22.
//

import Foundation
import RealmSwift

public class GameEntity: Object {

    @objc dynamic public var id: Int = 0
    @objc dynamic public var name: String? = ""
    @objc dynamic public var playtime: Int = 0
    @objc dynamic public var released: String? = ""
    @objc dynamic public var background_image: String = ""
    @objc dynamic public var rating: Double = 0.0

    public override static func primaryKey() -> String? {
        return "id"
    }
}
