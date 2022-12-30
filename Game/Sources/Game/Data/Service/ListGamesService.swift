//
//  ListGamesService.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 05/10/22.
//

import UIKit
import Alamofire
import RxSwift

public class ListGamesService: BaseService, ListGamesDataSourceProtocol {
    public func getListGamesFromSource() -> Observable<[ListGames]> {
        return Observable<[ListGames]>.create { observer in
            DispatchQueue.main.async {
            let urls = self.HOST_URL + APIEnum.listGamesData + self.apiKey
            if let url = URL(string: urls) {
                AF.request(url)
                  .validate()
                  .responseDecodable(of: ListGamesResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value.results!)
                        observer.onCompleted()
                    case .failure:
                        observer.onError("Error Get List Games" as! Error)
                    }
                }
            }
            }
            return Disposables.create()
        }
    }
}
