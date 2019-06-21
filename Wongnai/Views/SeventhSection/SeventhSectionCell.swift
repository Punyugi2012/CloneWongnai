//
//  SeventhSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 21/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class SeventhSectionCell: UICollectionViewCell {
    
    let hitRestaurantCollectionView = HitRestaurantCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(hitRestaurantCollectionView)
        hitRestaurantCollectionView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
