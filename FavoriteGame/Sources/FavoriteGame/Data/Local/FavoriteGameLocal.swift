//
//  FavoriteGameStorage.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 10/10/22.
//

import UIKit
import CoreData
import RxSwift
import RealmSwift


public class FavoriteGameLocal: FavoriteGameLocalProtocol {

    private let _realm: Realm

    public init(realm: Realm) {
        _realm = realm
    }

    public func getFavoriteGames() -> Observable<[GameEntity]> {
        return Observable<[GameEntity]>.create { observer in
            let games: Results<GameEntity> = {
                self._realm.objects(GameEntity.self)
                .sorted(byKeyPath: "name", ascending: true)
            }()
            observer.onNext(games.toArray(ofType: GameEntity.self))
            return Disposables.create()
        }
    }

    public func setFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            let myDataGame = GameEntity()
            myDataGame.setValue(dataCoreGames.id, forKey: "id")
            myDataGame.setValue(dataCoreGames.name, forKey: "name")
            myDataGame.setValue(dataCoreGames.released, forKey: "released")
            myDataGame.setValue(dataCoreGames.background_image, forKey: "background_image")
            myDataGame.setValue(dataCoreGames.rating, forKey: "rating")
            myDataGame.setValue(dataCoreGames.playtime, forKey: "playtime")
            try! self._realm.write {
                self._realm.add(myDataGame)
            }
            observer.onNext(true)
            return Disposables.create()
        }
    }

    public func deleteFavoriteGames(dataCoreGames: GameEntityRequest) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            let strId = String(format: "%d", dataCoreGames.id ?? 0)
            let games: Results<GameEntity> = {
                self._realm.objects(GameEntity.self)
                    .filter("id = \(strId)")
            }()
            if let game = games.first {
                try! self._realm.write {
                    self._realm.delete(game)
                }
            }
            observer.onNext(true)
            return Disposables.create()
        }
    }
}
