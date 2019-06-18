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
        homeController.tabBarItem = UITabBarItem(title: "หน้าแรก", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_selected"))
        
        let recentReviewController = UIViewController()
        recentReviewController.tabBarItem = UITabBarItem(title: "รีวิวล่าสุด", image: UIImage(named: "recent_review"), selectedImage: UIImage(named: "recent_review_selected"))
        
        let cookController = UIViewController()
        cookController.tabBarItem = UITabBarItem(title: "ทำอาหาร", image: UIImage(named: "cook"), selectedImage: UIImage(named: "cooked"))
        
        let bookmarksController = UIViewController()
        bookmarksController.tabBarItem = UITabBarItem(title: "ที่บันทึกไว้", image: UIImage(named: "bookmark"), selectedImage: UIImage(named: "bookmark_selected"))
        
        let profileController = UIViewController()
        profileController.tabBarItem = UITabBarItem(title: "ฉัน", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile_selected"))
        
        
        viewControllers = [homeNavigationController, recentReviewController, cookController, bookmarksController, profileController]
        
        for item in tabBar.items ?? [] {
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        }
        
    }
    
}
