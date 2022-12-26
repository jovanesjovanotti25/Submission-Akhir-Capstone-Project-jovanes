//
//  FavoriteGamesInteractor.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import Foundation
import RxSwift

class FavoriteGamesInteractor: NSObject {
    
    private let favoriteGameRepository: FavoriteGameRepositoryProtocol

    init(repository: FavoriteGameRepositoryProtocol) {
      self.favoriteGameRepository = repository
    }
 
}

extension FavoriteGamesInteractor: FavoriteGamesUseCase {
    func getFavoriteGames() -> Observable<[DataCoreGames]> {
        return favoriteGameRepository.getFavoriteGames()
    }
    
    func setFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool> {
        return favoriteGameRepository.setFavoriteGames(dataCoreGames: dataCoreGames)
    }
    
    func deleteFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool> {
        return favoriteGameRepository.deleteFavoriteGames(dataCoreGames: dataCoreGames)
    }
}
