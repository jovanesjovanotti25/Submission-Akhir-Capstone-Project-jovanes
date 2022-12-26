//
//  DetailGameViewModel.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import UIKit
import RxSwift

class DetailGameViewModel: NSObject {
    
    private let detailGameUseCase: DetailGameUseCase
    private let favoriteGamesUseCase: FavoriteGamesUseCase
        
    init(detailGameUseCase: DetailGameUseCase, favoriteGamesUseCase: FavoriteGamesUseCase) {
        self.detailGameUseCase = detailGameUseCase
        self.favoriteGamesUseCase = favoriteGamesUseCase
    }
    
    func getDetailGames(detailId: Int) -> Observable<DetailGame> {
        return detailGameUseCase.getDetailGames(detailId: detailId)
    }
    
    func getFavoriteGames() -> Observable<[DataCoreGames]>{
        return favoriteGamesUseCase.getFavoriteGames()
    }
    
    func setFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool>{
        return favoriteGamesUseCase.setFavoriteGames(dataCoreGames: dataCoreGames)
    }
    
    func deleteFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool>{
        return favoriteGamesUseCase.deleteFavoriteGames(dataCoreGames: dataCoreGames)
    }
    
}
