//
//  DetailGameDataSourceProtocol.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 20/12/22.
//

import Foundation
import RxSwift

protocol DetailGameDataSourceProtocol {
    func getDetailGameFromSource(detailId: Int) -> Observable<DetailGame>
}
