//
//  DetailGameRepository.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit
import RxSwift

public class DetailGameRepository: NSObject {
    
    private let detailGameDataSource: DetailGameDataSourceProtocol
    
    public init(dataSource: DetailGameDataSourceProtocol) {
      self.detailGameDataSource = dataSource
    }
}

extension DetailGameRepository: DetailGameRepositoryProtocol {
    
    public func getDetailGames(detailId: Int) -> Observable<DetailGame> {
        detailGameDataSource.getDetailGameFromSource(detailId: detailId)
    }
}
