//
//  FavoriteGameStorageProtocol.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import Foundation
import RxSwift

protocol FavoriteGameStorageProtocol {
    
    func getFavoriteGames() -> Observable<[DataCoreGames]>
    func setFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool>
    func deleteFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool>
    
}
