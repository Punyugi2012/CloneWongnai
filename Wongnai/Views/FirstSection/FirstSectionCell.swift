//
//  FirstSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit


struct Location {
    
    let name: String
    let distance: Int
    let imageName: String
    
}

struct LandmarkLocation {
    
    let name: String
    let imageName: String
    
}

struct OverAllLocation {
    
    var landmarkLocation: LandmarkLocation?
    let locations: [Location]
    
}

class FirstSectionCell: UICollectionViewCell {
    
    let nearShopCollectionView = HContentCollectionView()
    
    let nearShop = OverAllLocation(landmarkLocation: LandmarkLocation(name: "มหาวิทยาลัยบูรพา", imageName: "Burapha"), locations: [
        Location(name: "Cafe @ Library", distance: 25, imageName: "food1"),
        Location(name: "Seoul Bingsu Korean Dessert", distance: 500, imageName: "food2"),
        Location(name: "Insomnia Specialty Coffee", distance: 500, imageName: "food3"),
        Location(name: "Monkey & Me Cafe and Restaurant", distance: 500, imageName: "food4"),
        Location(name: "Umai & Sushi อาหารสไตล์ญี่ปุ่น", distance: 500, imageName: "food5"),
    ])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(nearShopCollectionView)
        nearShopCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 200))
        nearShopCollectionView.overAllLocation = self.nearShop
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
