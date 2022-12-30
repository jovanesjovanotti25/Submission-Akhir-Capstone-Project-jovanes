//
//  Injection.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 18/12/22.
//

import Foundation
import Game
import DetailGame
import FavoriteGame
import RealmSwift
import UIKit


final class Injection: NSObject {
 
    private func provideDataSource() -> ListGamesDataSourceProtocol {
      return ListGamesService()
    }

    private func provideRepository() -> ListGamesRepositoryProtocol {
      let listGamesDataSource = provideDataSource()
      return ListGamesRepository(dataSource: listGamesDataSource)
    }

    func provideUseCase() -> ListGamesUseCase {
        let listGamesRepository = provideRepository()
        return ListGamesInteractor(repository: listGamesRepository)
    }
    
    private func provideDataSourceDetail() -> DetailGameDataSourceProtocol {
      return DetailGameService()
    }
    
    private func provideRepositoryDetail() -> DetailGameRepositoryProtocol {
        let detailGameDataSource = provideDataSourceDetail()
      return DetailGameRepository(dataSource: detailGameDataSource)
    }
    
    func provideUseCaseDetail() -> DetailGameUseCase {
        let detailGameRepository = provideRepositoryDetail()
      return DetailGameInteractor(repository: detailGameRepository)
    }

    func provideDataLocalFavorite() -> FavoriteGameLocalProtocol {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return FavoriteGameLocal(realm: appDelegate.realm)
    }

    func provideLocalRepositoryFavorite() -> FavoriteGameLocalRepositoryProtocol {
      let favoriteGamesDataSource = provideDataLocalFavorite()
      return FavoriteGameLocalRepository(dataSource: favoriteGamesDataSource)
    }

    func provideLocalUseCaseFavorite() -> FavoriteGamesLocalUseCase {
        let favoriteGamesRepository = provideLocalRepositoryFavorite()
        return FavoriteGamesLocalInteractor(repository: favoriteGamesRepository)
    }
}
