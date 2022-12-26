//
//  ListFavoriteGamesViewController.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 10/10/22.
//

import UIKit
import Kingfisher
import RxSwift

class ListFavoriteGamesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyContainer: UIView!
    
    // Variable penampung untuk load table View
    var dataCoreGames = [DataCoreGames]()
    
    var presenter: ListFavoriteGamesViewModel!
    var loading: LoadingViewController?
    let identifier = "FavoriteGamesCell"
    let disposeBag = DisposeBag()



    override func viewDidLoad() {
        super.viewDidLoad()
//        setupBinding()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        loadData()
    }
    
    func loadData(){
        
        
        showLoadingIndicator()
        let listFavoriteGames = presenter.getFavoriteGames()
        
        listFavoriteGames
         .observe(on: MainScheduler.instance)
         .subscribe { result in
             self.dataCoreGames = result
             self.setupUI()
         } onError: { error in

         } onCompleted: {
             self.removeLoadingIndicator()
         }.disposed(by: disposeBag)
        
    }


    func setupUI(){

        if dataCoreGames.count == 0 {
            emptyContainer.isHidden = false
        } else {
            emptyContainer.isHidden = true
        }

        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
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
        loading?.loadingIndicator.stopAnimating()
        loading?.removeFromSuperview()
    }

    func presentDetailGame(detailGameId: Int){
        let detailGameViewController = ModuleBuilder.getView(module: .detailGame) as! DetailGameViewController
        detailGameViewController.modalPresentationStyle = .fullScreen
        detailGameViewController.detailGameId = detailGameId
        self.navigationController?.pushViewController(detailGameViewController, animated: true)
    }



}

extension ListFavoriteGamesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCoreGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FavoriteGamesCell
        let data = dataCoreGames[indexPath.row]
        
        if let urls = URL(string: data.background_image ?? ""){
            cell.imgFavGames.kf.setImage(with: urls)
        }
        cell.lblTitleFavGames.text = data.name
        cell.lblPlaytimeFavGames.text = "\(data.playtime ?? 0) Hour"
        cell.lblRatingFavGames.text = "\(data.rating ?? 0)"
        cell.lblReleaseFavGames.text = data.released
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presentDetailGame(detailGameId: dataCoreGames[indexPath.row].id!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
