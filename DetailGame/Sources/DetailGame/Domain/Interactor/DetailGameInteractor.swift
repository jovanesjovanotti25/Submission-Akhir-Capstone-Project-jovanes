//
//  DetailGameInteractor.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import Foundation
import RxSwift

public class DetailGameInteractor: NSObject {
    
    private let detailGameRepository: DetailGameRepositoryProtocol

    public init(repository: DetailGameRepositoryProtocol) {
      self.detailGameRepository = repository
    }
}

extension DetailGameInteractor: DetailGameUseCase {
    
    public func getDetailGames(detailId: Int) -> Observable<DetailGame> {
        return detailGameRepository.getDetailGames(detailId: detailId)
    }
}
