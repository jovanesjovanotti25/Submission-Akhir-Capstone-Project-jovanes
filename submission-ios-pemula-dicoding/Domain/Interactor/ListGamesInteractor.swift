//
//  ListGamesInteractor.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 18/12/22.
//

import Foundation
import RxSwift

class ListGamesInteractor: NSObject {
    
    private let listGamesRepository: ListGamesRepositoryProtocol

    init(repository: ListGamesRepositoryProtocol) {
      self.listGamesRepository = repository
    }
 
}

extension ListGamesInteractor: ListGamesUseCase {
    
    func getListGames() -> Observable<[ListGames]> {
        return listGamesRepository.getListGames()
    }
    
}
