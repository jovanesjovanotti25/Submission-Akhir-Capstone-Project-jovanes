//
//  DetailGameService.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit
import Alamofire
import RxSwift

class DetailGameService: BaseService, DetailGameDataSourceProtocol {
    
    func getDetailGameFromSource(detailId: Int) -> Observable<DetailGame> {
        return Observable<DetailGame>.create { observer in
            DispatchQueue.main.async {
                let urls = self.HOST_URL + "/" + String(detailId) + APIEnum.listGamesData + self.apiKey
            if let url = URL(string: urls) {
                AF.request(url)
                  .validate()
                  .responseDecodable(of: DetailGame.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure:
                        observer.onError("Error Get Detail Games" as! Error)
                    }
                }
            }
            }
            return Disposables.create()
        }
    }
}
