//
//  DetailGameInteractor.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import Foundation
import RxSwift

class DetailGameInteractor: NSObject {
    
    private let detailGameRepository: DetailGameRepositoryProtocol

    init(repository: DetailGameRepositoryProtocol) {
      self.detailGameRepository = repository
    }
 
}

extension DetailGameInteractor: DetailGameUseCase {
    
    func getDetailGames(detailId: Int) -> Observable<DetailGame> {
        return detailGameRepository.getDetailGames(detailId: detailId)
    }
    
}
