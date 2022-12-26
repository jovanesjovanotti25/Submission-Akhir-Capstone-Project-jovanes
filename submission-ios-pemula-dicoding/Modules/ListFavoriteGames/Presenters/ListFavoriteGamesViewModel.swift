//
//  ListFavoriteGamesViewModel.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import UIKit
import RxSwift

class ListFavoriteGamesViewModel: NSObject {

    private let favoriteGamesUseCase: FavoriteGamesUseCase
        
    init(favoriteGamesUseCase: FavoriteGamesUseCase) {
      self.favoriteGamesUseCase = favoriteGamesUseCase
    }
    
    func getFavoriteGames() -> Observable<[DataCoreGames]> {
        return favoriteGamesUseCase.getFavoriteGames()
    }
    
}
