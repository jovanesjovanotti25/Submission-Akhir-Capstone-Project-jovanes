//
//  MainViewController.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 21/09/22.
//

import UIKit
import Kingfisher
import RxSwift
import Game
import RealmSwift

class MainViewController: UIViewController {

    @IBOutlet weak var btnViewProfile: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let identifier = "ListSportCell"
    var loading: LoadingViewController?
    var presenter: MainViewModel!

    var filteredData = [ListGames]()
    var listGames = [ListGames]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    func setupUI(){
        
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        
        searchBar.delegate = self
        searchBar.placeholder = "Search Games"
        tableView.delegate = self
        tableView.dataSource = self
        
        btnViewProfile.imageView?.layer.cornerRadius = 20
        btnViewProfile.layer.cornerRadius = 20
        btnViewProfile.layer.borderWidth = 1
        btnViewProfile.layer.borderColor = UIColor.white.cgColor
       
    }

    func loadData(){
        showLoadingIndicator()
        let listGame = presenter.getListGames()
        listGame
         .observe(on: MainScheduler.instance)
         .subscribe { result in
            self.listGames = result
            self.filteredData = result
            self.tableView.reloadData()
         } onError: { error in

         } onCompleted: {
             self.removeLoadingIndicator()
         }.disposed(by: disposeBag)
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
    
    @IBAction func btnActionViewProfile(_ sender: Any) {
        self.navigationController?.pushViewController(ModuleBuilder.getView(module: .profile), animated: true)
    }
    
    @IBAction func btnActionViewFavoriteGames(_ sender: Any) {
        self.navigationController?.pushViewController(ModuleBuilder.getView(module: .listFavoriteGames), animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.enablesReturnKeyAutomatically = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.enablesReturnKeyAutomatically = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? listGames : listGames.filter({ results -> Bool in
            return results.name!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        tableView.reloadData()
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ListSportCell
        let data = filteredData[indexPath.row]
        if let urls = URL(string: data.background_image ?? ""){
            cell.imageGame.kf.setImage(with: urls)
        }
        
        let genresGame = data.genres?.prefix(3).map { $0.name ?? "" }.joined(separator: ", ")
        let changeDateReleaseFormate = DateTime.dateFormatter(date: data.released ?? "")
        
        cell.lblTitleGame.text = data.name
        cell.lblReleaseGame.text = changeDateReleaseFormate
        cell.lblPlayTime.text = "\(data.playtime ?? 0) Hour"
        cell.lblGenreGame.text = genresGame
        cell.lblRateGame.text = "\(data.rating ?? 0)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presentDetailGame(detailGameId: filteredData[indexPath.row].id!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
