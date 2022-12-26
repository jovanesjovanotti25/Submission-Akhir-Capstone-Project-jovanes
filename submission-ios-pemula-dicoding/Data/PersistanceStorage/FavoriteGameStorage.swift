//
//  FavoriteGameStorage.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 10/10/22.
//

import UIKit
import CoreData
import RxSwift

class FavoriteGameStorage: FavoriteGameStorageProtocol {
    
    func getFavoriteGames() -> Observable<[DataCoreGames]> {
        return Observable<[DataCoreGames]>.create { observer in
            var favGames = [DataCoreGames]()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let manageContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteGames")
            do {
                let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
                for data in result {
                    favGames.append(
                        
                        DataCoreGames(
                            id: data.value(forKey: "favoriteGame_Id") as? Int,
                            name: data.value(forKey: "favoriteGame_Name") as? String,
                            playtime: data.value(forKey: "favoriteGame_Playtime") as? Int,
                            released: data.value(forKey: "favoriteGame_Release") as? String,
                            background_image: data.value(forKey: "favoriteGame_BackgroundImage") as? String,
                            rating: data.value(forKey: "favoriteGame_Rating") as? Double
                        )
                    )
                }
                observer.onNext(favGames)
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
    
    func setFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            
            
            print("setFavoriteGames")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let manageContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "FavoriteGames", in: manageContext)
            
            let insert = NSManagedObject(entity: entity!, insertInto: manageContext)
            insert.setValue(dataCoreGames.id, forKey: "favoriteGame_Id")
            insert.setValue(dataCoreGames.name, forKey: "favoriteGame_Name")
            insert.setValue(dataCoreGames.released, forKey: "favoriteGame_Release")
            insert.setValue(dataCoreGames.background_image, forKey: "favoriteGame_BackgroundImage")
            insert.setValue(dataCoreGames.rating, forKey: "favoriteGame_Rating")
            insert.setValue(dataCoreGames.playtime, forKey: "favoriteGame_Playtime")

            print("insert \(insert)")
            
            UserDefaults.standard.setValue(dataCoreGames.id, forKey: "LISTGAME_ID_SAVED")
            
            do {
                try manageContext.save()
                observer.onNext(true)
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            
         
            return Disposables.create()
        }
        
        
    }

    
    func deleteFavoriteGames(dataCoreGames: DataCoreGames) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let manageContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteGames")
            fetchRequest.predicate = NSPredicate(format: "favoriteGame_Id = %id", dataCoreGames.id!)
            
            do {
                let fetch = try manageContext.fetch(fetchRequest)
                let delete = fetch[0] as! NSManagedObject
                manageContext.delete(delete)
                
                try manageContext.save()
                observer.onNext(true)
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
            
            
            return Disposables.create()
        }
    }
    
    
}
