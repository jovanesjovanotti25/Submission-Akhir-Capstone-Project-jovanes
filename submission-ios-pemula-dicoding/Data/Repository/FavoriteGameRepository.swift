//
//  FavoriteGameRepository.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import UIKit
import RxSwift

class FavoriteGameRepository: NSObject {
    
    private let favoriteGameStorage: FavoriteGameStorageProtocol
    
    init(dataSource: FavoriteGameStorageProtocol) {
      self.favoriteGameStorage = dataSource
    }

}

extension FavoriteGameRepository: FavoriteGameRepositoryProtocol {

    func getFavoriteGames() -> Observable<[DataCoreGames]> {
        favoriteGameStorage.getFavoriteGames()
    }
    
    func setFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool> {
        favoriteGameStorage.setFavoriteGames(dataCoreGames: dataCoreGames)
    }
    
    func deleteFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool> {
        favoriteGameStorage.deleteFavoriteGames(dataCoreGames: dataCoreGames)
    }
    
}
