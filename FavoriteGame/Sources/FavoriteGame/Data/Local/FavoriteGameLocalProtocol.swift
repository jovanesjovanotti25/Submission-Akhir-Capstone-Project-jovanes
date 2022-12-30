//
//  File.swift
//  
//
//  Created by Jovanes Jovanotti on 30/12/22.
//

import UIKit
import RxSwift

public protocol FavoriteGameLocalProtocol {

    func getFavoriteGames() -> Observable<[GameEntity]>
    func setFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool>
    func deleteFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool>

}
