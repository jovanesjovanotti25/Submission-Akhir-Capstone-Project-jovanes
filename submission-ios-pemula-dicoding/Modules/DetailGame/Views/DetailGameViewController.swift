//
//  DetailGameViewController.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 06/10/22.
//

import UIKit
import RxSwift

class DetailGameViewController: UIViewController {
    
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblTitleGame: UILabel!
    @IBOutlet weak var lblReleaseGame: UILabel!
    @IBOutlet weak var lblDescGame: UILabel!
    @IBOutlet weak var lblGenreGame: UILabel!
    @IBOutlet weak var lblRateGame: UILabel!
    @IBOutlet weak var lblRateTopGame: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblPublishGame: UILabel!
    @IBOutlet weak var lblDeveloperGame: UILabel!
    @IBOutlet weak var btnFavoriteGame: UIButton!
    @IBOutlet weak var icBtnFavoriteGame: UIImageView!
    @IBOutlet weak var lblBtnFavoriteGame: UILabel!
    
    
    var detailGameData: DetailGame?
    var detailGameId: Int?
    var gameRate: [Rating]?
    let identifier = "RatingCell"
    var presenter: DetailGameViewModel!

    
    // Variable penampung untuk check list Favorite
    var dataCoreGames = [DataCoreGames]()
    var loading: LoadingViewController?
    let disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        loadData()
    }
    
    func loadData() {

        showLoadingIndicator()

        
        let listFavoriteGames = presenter.getFavoriteGames()
        
        
        listFavoriteGames
         .observe(on: MainScheduler.instance)
         .subscribe { result in
             self.dataCoreGames = result
//             DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {

//             }
         } onError: { error in

         } onCompleted: {

         }.disposed(by: disposeBag)
        
        let detailGame = presenter.getDetailGames(detailId: detailGameId!)
        
        detailGame
         .observe(on: MainScheduler.instance)
         .subscribe { result in
             self.detailGameData = result
             self.setupFavoriteGame()
             self.setupUI(detailGame: result)
             self.title = self.detailGameData?.name
         } onError: { error in

         } onCompleted: {
             self.removeLoadingIndicator()
         }.disposed(by: disposeBag)
        
        
        

    }
    
    func setupUI(detailGame: DetailGame?){
        
        gameRate = detailGame?.ratings
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let changeDateReleaseFormate = DateTime.dateFormatter(date: detailGame?.released ?? "")
        
        let genresGame = detailGame?.genres?.prefix(3).map { $0.name ?? "" }.joined(separator: ", ")
        let publishedGame = detailGame?.publishers?.prefix(3).map { $0.name ?? "" }.joined(separator: ", ")
        let developerGame = detailGame?.developers?.prefix(3).map { $0.name ?? "" }.joined(separator: ", ")
        
        if let urls = URL(string: detailGame?.background_image ?? ""){
            imgGame.kf.setImage(with: urls)
        }
        
        lblTitleGame.text = detailGame?.name
        lblReleaseGame.text = changeDateReleaseFormate
        lblDescGame.text = detailGame?.description_raw
        lblGenreGame.text = genresGame
        lblRateGame.text = "\(detailGame?.rating ?? 0)"
        lblRateTopGame.text = "out of \(detailGame?.rating_top ?? 5)"
        lblPublishGame.text = publishedGame
        lblDeveloperGame.text = developerGame
    }
    
    func setupFavoriteGame(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            if  self.checkFavoriteGames() {
            if #available(iOS 13.0, *) {
                self.icBtnFavoriteGame.image = UIImage(systemName: "heart.fill")
            } else {
                self.icBtnFavoriteGame.image = UIImage(named: "heart.fill")
            }
                self.lblBtnFavoriteGame.text = "Favorited"
        } else {
            if #available(iOS 13.0, *) {
                self.icBtnFavoriteGame.image = UIImage(systemName: "heart")
            } else {
                self.icBtnFavoriteGame.image = UIImage(named: "heart")
            }
            self.lblBtnFavoriteGame.text = "Add to Favorites"
        }
//        }
    }
    
    func checkFavoriteGames() -> Bool {
        let exists = dataCoreGames.first (where:{ $0.id == detailGameData?.id })
        if  exists != nil {
          return true
        }
        return false
    }
    
    func showLoadingIndicator() {
        loading = LoadingViewController()
        self.view.addSubview(loading!)
        loading?.translatesAutoresizingMaskIntoConstraints = false
        loading?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        loading?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        loading?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        loading?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        loading?.loadingIndicator.startAnimating()
    }
    
    func removeLoadingIndicator() {
        print("======= MASUK removeLoadingIndicator")
            loading?.loadingIndicator.stopAnimating()
            loading?.removeFromSuperview()
    }
    
    
    @IBAction func btnActionFavoriteGame(_ sender: Any) {
        print("btnActionFavoriteGame")
        let changeDateReleaseFormate = DateTime.dateFormatter(date: detailGameData?.released ?? "")
        
        let favGames = DataCoreGames(
            id: detailGameData?.id,
            name: detailGameData?.name,
            playtime: detailGameData?.playtime,
            released: changeDateReleaseFormate,
            background_image: detailGameData?.background_image,
            rating: detailGameData?.rating
        )
        print("favGames \(favGames)")
        
        if checkFavoriteGames(){
            
            let usecase = Injection.init().provideUseCaseDetail()
            let usecasFavoritee = Injection.init().provideUseCaseFavorite()
            let presenter = DetailGameViewModel(detailGameUseCase: usecase, favoriteGamesUseCase: usecasFavoritee)

            
            let deleteFavoriteGames = presenter.deleteFavoriteGames(dataCoreGames: favGames)

            deleteFavoriteGames
             .observe(on: MainScheduler.instance)
             .subscribe { result in
                 print("deleteFavoriteGames \(result)")
                 self.loadData()
             } onError: { error in
                 
             } onCompleted: {
                 
             }.disposed(by: disposeBag)
            
        } else {
            let usecase = Injection.init().provideUseCaseDetail()
            let usecasFavoritee = Injection.init().provideUseCaseFavorite()
            let presenter = DetailGameViewModel(detailGameUseCase: usecase, favoriteGamesUseCase: usecasFavoritee)

            
            let setFavoriteGames = presenter.setFavoriteGames(dataCoreGames: favGames)

            setFavoriteGames
             .observe(on: MainScheduler.instance)
             .subscribe { result in
                 print("setFavoriteGames \(result)")
                 self.loadData()
             } onError: { error in
                 
             } onCompleted: {
                 
             }.disposed(by: disposeBag)
        }
        
    }
    

}

extension DetailGameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameRate!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RatingCell
        let data = gameRate![indexPath.row]
        cell.lblPersentageRate.text = "\(String(format: "%.f", round(data.percent ?? 0)))%"
        cell.lblDescRate.text = data.title
        cell.lblUserRate.text = "\(data.count ?? 0) users say this!"
        
        if data.title == "exceptional" {
            cell.lblDescRate.textColor = UIColor.green
        } else if data.title == "recommended" {
            cell.lblDescRate.textColor = UIColor.purple
        } else if data.title == "meh" {
            cell.lblDescRate.textColor = UIColor.orange
        } else if data.title == "skip" {
            cell.lblDescRate.textColor = UIColor.red
        } else {
            cell.lblDescRate.textColor = UIColor.black
        }

        return cell

    }
    
    
    
    
}
