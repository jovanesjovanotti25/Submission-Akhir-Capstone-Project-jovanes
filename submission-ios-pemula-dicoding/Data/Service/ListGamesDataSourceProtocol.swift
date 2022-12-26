//
//  ListGamesDataSourceProtocol.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 18/12/22.
//

import Foundation
import RxSwift

protocol ListGamesDataSourceProtocol {
    func getListGamesFromSource() -> Observable<[ListGames]>
}
