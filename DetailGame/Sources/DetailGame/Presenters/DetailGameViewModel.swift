//
//  DetailGameViewModel.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import UIKit
import RxSwift
import FavoriteGame

public class DetailGameViewModel: NSObject {
    
    private let detailGameUseCase: DetailGameUseCase
    private let favoriteGamesUseCase: FavoriteGamesLocalUseCase
        
    public init(detailGameUseCase: DetailGameUseCase, favoriteGamesUseCase: FavoriteGamesLocalUseCase) {
        self.detailGameUseCase = detailGameUseCase
        self.favoriteGamesUseCase = favoriteGamesUseCase
    }
    
    public func getDetailGames(detailId: Int) -> Observable<DetailGame> {
        return detailGameUseCase.getDetailGames(detailId: detailId)
    }
    
    public func getFavoriteGames() -> Observable<[GameEntity]>{
        return favoriteGamesUseCase.getFavoriteGames()
    }
    
    public func setFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool>{
        return favoriteGamesUseCase.setFavoriteGames(dataCoreGames: dataCoreGames)
    }
    
    public func deleteFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool>{
        return favoriteGamesUseCase.deleteFavoriteGames(dataCoreGames: dataCoreGames)
    }
}
