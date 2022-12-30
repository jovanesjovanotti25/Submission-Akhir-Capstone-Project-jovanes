//
//  DetailGameUseCase.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import Foundation
import RxSwift

public protocol DetailGameUseCase {

  func getDetailGames(detailId: Int) -> Observable<DetailGame>
}
