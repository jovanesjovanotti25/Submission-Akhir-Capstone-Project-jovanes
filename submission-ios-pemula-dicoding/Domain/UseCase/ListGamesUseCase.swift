//
//  ListGamesUseCase.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 18/12/22.
//

import Foundation
import RxSwift

protocol ListGamesUseCase {

  func getListGames() -> Observable<[ListGames]>

}
