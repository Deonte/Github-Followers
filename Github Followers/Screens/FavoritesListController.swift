//
//  FavoritesListController.swift
//  Github Followers
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import UIKit



class FavoritesListController: UIViewController {
    
    let tableView = UITableView()
    var favorites: [Follower] = []

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureTableView()
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }
    
    
    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "No Favorites?\nAdd one on the follower screen.", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad stuff happened. 🤕", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}


extension FavoritesListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID, for: indexPath) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(follower: favorite)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destinationVC = FollowerListController(username: favorite.login)
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
            guard let self = self else { return }
        
            guard let error = error else { return }
            
            self.presentGFAlertOnMainThread(title: "Unable to remove.", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}
