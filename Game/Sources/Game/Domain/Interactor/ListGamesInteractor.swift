//
//  ListGamesInteractor.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 18/12/22.
//

import Foundation
import RxSwift

public class ListGamesInteractor: NSObject {
    
    private let listGamesRepository: ListGamesRepositoryProtocol

    public init(repository: ListGamesRepositoryProtocol) {
      self.listGamesRepository = repository
    }
}

extension ListGamesInteractor: ListGamesUseCase {
    
    public func getListGames() -> Observable<[ListGames]> {
        return listGamesRepository.getListGames()
    }
}
