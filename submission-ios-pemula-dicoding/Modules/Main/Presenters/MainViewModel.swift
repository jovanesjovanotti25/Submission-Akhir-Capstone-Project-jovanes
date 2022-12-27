//
//  MainViewModel.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 22/09/22.
//

import UIKit
import RxSwift

class MainViewModel: NSObject {
    
    private let listGamesUseCase: ListGamesUseCase
    
    init(listGamesUseCase: ListGamesUseCase) {
      self.listGamesUseCase = listGamesUseCase
    }
    
    func getListGames() -> Observable<[ListGames]> {
        return listGamesUseCase.getListGames()
     }

}

