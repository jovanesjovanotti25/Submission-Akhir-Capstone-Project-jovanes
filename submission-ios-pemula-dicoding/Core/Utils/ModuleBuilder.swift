//
//  ModuleBuilder.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 22/09/22.
//

import UIKit
import Game
import DetailGame
import FavoriteGame

class ModuleBuilder: NSObject {
        class func getView(module: ModuleEnum) -> UIViewController {
            switch module {
            case .splashScreen:
                let splashViewController = SplashViewController()
                splashViewController.modalPresentationStyle = .fullScreen
                return splashViewController
            case .main:
                let usecase = Injection.init().provideUseCase()
                let presenter = MainViewModel(listGamesUseCase: usecase)
                let  mainViewController = MainViewController()
                mainViewController.presenter = presenter
                mainViewController.modalPresentationStyle = .fullScreen
                return mainViewController
            case .profile:
                let  profileViewController = ProfileViewController()
                profileViewController.modalPresentationStyle = .fullScreen
                profileViewController.title = "Profile"
                return profileViewController
            case .listFavoriteGames:
                let usecase = Injection.init().provideLocalUseCaseFavorite()
                let presenter = ListFavoriteGamesViewModel(favoriteGamesUseCase: usecase)
                let  listFavoriteGamesViewController = ListFavoriteGamesViewController()
                listFavoriteGamesViewController.presenter = presenter
                listFavoriteGamesViewController.modalPresentationStyle = .fullScreen
                listFavoriteGamesViewController.title = "Favorite Games"
                return listFavoriteGamesViewController
            case .detailGame:
                let usecase = Injection.init().provideUseCaseDetail()
                let usecasFavoritee = Injection.init().provideLocalUseCaseFavorite()
                let presenter = DetailGameViewModel(detailGameUseCase: usecase, favoriteGamesUseCase: usecasFavoritee)

                let  detailGameViewController = DetailGameViewController()
                detailGameViewController.presenter = presenter
                detailGameViewController.modalPresentationStyle = .fullScreen
                return detailGameViewController
            }
        }
}
