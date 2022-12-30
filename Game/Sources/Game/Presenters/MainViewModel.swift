//
//  MainViewModel.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 22/09/22.
//

import UIKit
import RxSwift

public class MainViewModel: NSObject {
    
    private let listGamesUseCase: ListGamesUseCase
    
    public init(listGamesUseCase: ListGamesUseCase) {
      self.listGamesUseCase = listGamesUseCase
    }

    public func getListGames() -> Observable<[ListGames]> {
        return listGamesUseCase.getListGames()
     }
}

