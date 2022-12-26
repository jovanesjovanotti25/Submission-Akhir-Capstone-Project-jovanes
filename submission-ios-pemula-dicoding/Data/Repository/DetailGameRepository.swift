//
//  DetailGameRepository.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit
import RxSwift

class DetailGameRepository: NSObject {
    
    private let detailGameDataSource: DetailGameDataSourceProtocol
    
    init(dataSource: DetailGameDataSourceProtocol) {
      self.detailGameDataSource = dataSource
    }

}

extension DetailGameRepository: DetailGameRepositoryProtocol {
    
    func getDetailGames(detailId: Int) -> Observable<DetailGame> {
        detailGameDataSource.getDetailGameFromSource(detailId: detailId)
    }
    
}
