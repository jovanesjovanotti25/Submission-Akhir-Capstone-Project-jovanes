//
//  File.swift
//  
//
//  Created by Jovanes Jovanotti on 30/12/22.
//

import Foundation
import RxSwift

public protocol FavoriteGameLocalRepositoryProtocol {

    func getFavoriteGames() -> Observable<[GameEntity]>
    func setFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool>
    func deleteFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool>

}
