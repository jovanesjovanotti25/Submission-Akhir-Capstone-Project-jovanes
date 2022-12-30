//
//  File.swift
//  
//
//  Created by Jovanes Jovanotti on 30/12/22.
//

import UIKit
import RxSwift

public class FavoriteGameLocalRepository: NSObject {

    private let favoriteGameStorage: FavoriteGameLocalProtocol

    public init(dataSource: FavoriteGameLocalProtocol) {
      self.favoriteGameStorage = dataSource
    }

}

extension FavoriteGameLocalRepository: FavoriteGameLocalRepositoryProtocol {

    public func getFavoriteGames() -> Observable<[GameEntity]> {
        favoriteGameStorage.getFavoriteGames()
    }

    public func setFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool> {
        favoriteGameStorage.setFavoriteGames(dataCoreGames: dataCoreGames)
    }

    public func deleteFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool> {
        favoriteGameStorage.deleteFavoriteGames(dataCoreGames: dataCoreGames)
    }

}

