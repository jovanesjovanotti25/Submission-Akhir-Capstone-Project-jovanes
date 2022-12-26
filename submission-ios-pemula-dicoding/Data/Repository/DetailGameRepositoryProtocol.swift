//
//  DetailGameRepositoryProtocol.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import Foundation
import RxSwift

protocol DetailGameRepositoryProtocol {
    
    func getDetailGames(detailId: Int) -> Observable<DetailGame>
 
}
