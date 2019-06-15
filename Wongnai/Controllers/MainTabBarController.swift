//
//  MainTabbarController.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 15/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let homeNavigationController = UINavigationController(rootViewController: homeController)
        homeController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        
        let recentReviewController = UIViewController()
        recentReviewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        let cookController = UIViewController()
        cookController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let bookmarksController = UIViewController()
        bookmarksController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        let profileController = UIViewController()
        profileController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        
        viewControllers = [homeNavigationController, recentReviewController, cookController, bookmarksController, profileController]
        
    }
    
}
