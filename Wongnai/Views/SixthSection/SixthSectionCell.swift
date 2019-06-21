//
//  SixthSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 21/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct RecommendedBrand {
    
    let imageName: String
    let isAd: Bool
    
}

class SixthSectionCell: UICollectionViewCell {
    
    let recommenedBrandCollectionView = RecommenedBrandCollectionView()
    
    let recommendedBrands: [RecommendedBrand] = [
        RecommendedBrand(imageName: "rb1", isAd: true),
        RecommendedBrand(imageName: "rb2", isAd: true),
        RecommendedBrand(imageName: "rb3", isAd: false),
        RecommendedBrand(imageName: "rb4", isAd: false),
        RecommendedBrand(imageName: "rb5", isAd: false),
        RecommendedBrand(imageName: "rb6", isAd: false),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(recommenedBrandCollectionView)
        recommenedBrandCollectionView.fillSuperview()
        recommenedBrandCollectionView.recommendedBrands = recommendedBrands
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
