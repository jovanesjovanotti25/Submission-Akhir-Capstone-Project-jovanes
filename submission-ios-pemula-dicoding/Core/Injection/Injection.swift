//
//  Injection.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 18/12/22.
//

import Foundation

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
    
    
    private func provideDataSourceFavorite() -> FavoriteGameStorageProtocol {
      return FavoriteGameStorage()
    }

    private func provideRepositoryFavorite() -> FavoriteGameRepositoryProtocol {
      let favoriteGamesDataSource = provideDataSourceFavorite()
      return FavoriteGameRepository(dataSource: favoriteGamesDataSource)
    }

    func provideUseCaseFavorite() -> FavoriteGamesUseCase {
        let favoriteGamesRepository = provideRepositoryFavorite()
        return FavoriteGamesInteractor(repository: favoriteGamesRepository)
    }
}
