//
//  File.swift
//  
//
//  Created by Jovanes Jovanotti on 30/12/22.
//

import Foundation
import RxSwift

public class FavoriteGamesLocalInteractor: NSObject {

    private let favoriteGameRepository: FavoriteGameLocalRepositoryProtocol

    public init(repository: FavoriteGameLocalRepositoryProtocol) {
      self.favoriteGameRepository = repository
    }

}

extension FavoriteGamesLocalInteractor: FavoriteGamesLocalUseCase {
    public func getFavoriteGames() -> Observable<[GameEntity]> {
        return favoriteGameRepository.getFavoriteGames()
    }

    public func setFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool> {
        return favoriteGameRepository.setFavoriteGames(dataCoreGames: dataCoreGames)
    }

    public func deleteFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool> {
        return favoriteGameRepository.deleteFavoriteGames(dataCoreGames: dataCoreGames)
    }
}
