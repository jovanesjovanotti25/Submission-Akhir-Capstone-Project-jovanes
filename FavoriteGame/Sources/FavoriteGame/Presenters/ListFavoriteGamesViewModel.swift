//
//  ListFavoriteGamesViewModel.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import UIKit
import RxSwift

public class ListFavoriteGamesViewModel: NSObject {

    private let favoriteGamesUseCase: FavoriteGamesLocalUseCase
        
    public init(favoriteGamesUseCase: FavoriteGamesLocalUseCase) {
      self.favoriteGamesUseCase = favoriteGamesUseCase
    }
    
    public func getFavoriteGames() -> Observable<[GameEntity]> {
        return favoriteGamesUseCase.getFavoriteGames()
    }
    
}
