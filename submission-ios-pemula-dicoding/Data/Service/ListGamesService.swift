//
//  ListGamesService.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 05/10/22.
//

import UIKit
import Alamofire
import RxSwift


class ListGamesService: BaseService, ListGamesDataSourceProtocol {
    
    func getListGamesFromSource() -> Observable<[ListGames]> {
        print("===== Masuk getListGamesFromSource")
        return Observable<[ListGames]>.create { observer in
            print("===== observer \(observer)")
            
            DispatchQueue.main.async {
            
            let urls = self.HOST_URL + APIEnum.listGamesData + self.apiKey
            if let url = URL(string: urls) {
                AF.request(url)
                  .validate()
                  .responseDecodable(of: ListGamesResponse.self) { response in
                      print("===== response \(response)")
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


