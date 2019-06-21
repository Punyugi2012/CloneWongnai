//
//  SeventhSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 21/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct HitRestaurant {
    
    let name: String
    let rank: Int
    let score: Float
    let nReview: Int
    let imageName: String
    let isCheck: Bool
    
}

class SeventhSectionCell: UICollectionViewCell {
    
    let hitRestaurantCollectionView = HitRestaurantCollectionView()
    
    let hitRestaurants: [HitRestaurant] = [
        HitRestaurant(name: "Le Boeuf The Steak & Fires", rank: 1, score: 4.0, nReview: 315, imageName: "hr1", isCheck: false),
        HitRestaurant(name: "Isao", rank: 2, score: 4.2, nReview: 431, imageName: "hr2", isCheck: true),
        HitRestaurant(name: "Bankara Ramen สุขุมวิท 39", rank: 3, score: 4.1, nReview: 449, imageName: "hr3", isCheck: true)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(hitRestaurantCollectionView)
        hitRestaurantCollectionView.fillSuperview()
        hitRestaurantCollectionView.hitRestaurants = hitRestaurants
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
