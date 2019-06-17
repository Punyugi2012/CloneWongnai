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
    
    let nearShopCollectionView: NearShop_HitNearCollectionView = {
        let hccv = NearShop_HitNearCollectionView()
        hccv.titleLabel.text = "ร้านใกล้ตัว"
        return hccv
    }()
    
    let hitNearCollecitonView: NearShop_HitNearCollectionView = {
        let hccv = NearShop_HitNearCollectionView()
        hccv.titleLabel.text = "ที่เที่ยวยอดนิยม ในชลบุรี"
        return hccv
    }()
    
    let dontMissCollectionView = DontMissCollectionView()
    
    let nearShop = OverAllLocation(landmarkLocation: LandmarkLocation(name: "มหาวิทยาลัยบูรพา", imageName: "Burapha"), locations: [
        Location(name: "Cafe @ Library", distance: 25, imageName: "food1"),
        Location(name: "Seoul Bingsu Korean Dessert", distance: 200, imageName: "food2"),
        Location(name: "Insomnia Specialty Coffee", distance: 300, imageName: "food3"),
        Location(name: "Monkey & Me Cafe and Restaurant", distance: 400, imageName: "food4"),
        Location(name: "Umai & Sushi อาหารสไตล์ญี่ปุ่น", distance: 500, imageName: "food5"),
    ])
    
    let hitNear = OverAllLocation(landmarkLocation: nil, locations: [
        Location(name: "ตลาดจีนโบราณชากแง้ว", distance: 5000, imageName: "place1"),
        Location(name: "เกาะล้าน", distance: 4300, imageName: "place2"),
        Location(name: "Silver Lake", distance: 5800, imageName: "place3"),
        Location(name: "สวนสัตว์เปิดเขาเขียว", distance: 1600, imageName: "place4"),
        Location(name: "เกาะขาม", distance: 7800, imageName: "place5"),
    ])
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(nearShopCollectionView)
        nearShopCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 200))
        nearShopCollectionView.overAllLocation = nearShop
        
        self.addSubview(hitNearCollecitonView)
        hitNearCollecitonView.anchor(top: nearShopCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 200))
        hitNearCollecitonView.overAllLocation = hitNear
        
        self.addSubview(dontMissCollectionView)
        dontMissCollectionView.anchor(top: hitNearCollecitonView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 270))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
