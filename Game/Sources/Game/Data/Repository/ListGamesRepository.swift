//
//  ListGamesRepository.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit
import RxSwift

public class ListGamesRepository: NSObject {
    private let listGamesDataSource: ListGamesDataSourceProtocol
    public init(dataSource: ListGamesDataSourceProtocol) {
      self.listGamesDataSource = dataSource
    }
}

extension ListGamesRepository: ListGamesRepositoryProtocol {
    public func getListGames() -> Observable<[ListGames]> {
        listGamesDataSource.getListGamesFromSource()
    }
}

