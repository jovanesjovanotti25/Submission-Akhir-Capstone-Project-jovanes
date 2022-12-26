//
//  ListGamesRepository.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit
import RxSwift

class ListGamesRepository: NSObject {
    
    private let listGamesDataSource: ListGamesDataSourceProtocol
   
    init(dataSource: ListGamesDataSourceProtocol) {
      self.listGamesDataSource = dataSource
    }
    
}

extension ListGamesRepository: ListGamesRepositoryProtocol {
    
    func getListGames() -> Observable<[ListGames]> {
        listGamesDataSource.getListGamesFromSource()
    }
    
}

