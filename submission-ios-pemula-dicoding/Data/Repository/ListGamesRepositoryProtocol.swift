//
//  ListGamesRepositoryProtocol.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 19/12/22.
//

import Foundation
import RxSwift

protocol ListGamesRepositoryProtocol {
    
    func getListGames() -> Observable<[ListGames]>
 
}
