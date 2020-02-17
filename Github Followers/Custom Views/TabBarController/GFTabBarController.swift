//
//  GFTabBarController.swift
//  Github Followers
//
//  Created by Deonte on 2/1/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    
    func createSearchNC() -> UINavigationController {
        let searchController = SearchController()
        searchController.title = "Search"
        searchController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchController)
    }
    
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC(), createFavoritesNC()]

    }
    
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesController = FavoritesListController()
        favoritesController.title = "Favorites"
        favoritesController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesController)
    }
    
}
