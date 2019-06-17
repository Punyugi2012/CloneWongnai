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

struct DontMissLocation {
    
    let name: String
    let caption: String
    let imageName: String
    
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
    
    let dontMissLocations: [DontMissLocation] = [
        DontMissLocation(name: "Coffee Brewflavors", caption: "ร้านสไตล์ industrial loft เป็นคาเฟ่เล็กๆ ที่เต็มไปด้วยเมล็ดกาแฟคุณภาพ กลิ่นคั่วกาแฟหอมติดจมูก พร้อมเสิร์ฟความอบอุ่นให้ลูกค้า", imageName: "dm1"),
        DontMissLocation(name: "Dude Coffee Bar X SM", caption: "ร้านเปิดใหม่จากการรวมตัวของคนรักกาแฟ ร้านเรียบง่าย สไตล์สายฮิป โซนบางแสน", imageName: "dm2"),
        DontMissLocation(name: "Hops Addict Bangsaen", caption: "สายชิลล์รู้จักกันดี! ร้านกินดื่มสไตล์อิตาเลียน มีเครื่องดื่มอย่างเบียร์ให้เลือกหลายประเภท นอกจากนี้ยังมีอาหารอิตาเลียนขึ้นชื่ออย่างพิซซ่าและเมนูกินเล่นมากมาย", imageName: "dm3"),
        DontMissLocation(name: "Plantaehouse", caption: "คาเฟ่บรรยากาศน่ารัก ล้อมรอบไปด้วยต้นไม้สีเขียวสบายตา เหมาะกับการมานั่งจิบน้ำกินขนม ชิลๆ ทำงาน อ่านหนังสือก็ดี เงียบสงบ", imageName: "dm4"),
        DontMissLocation(name: "Sleepless Cafe'", caption: "คาเฟ่เปิดตลอด 24 ชั่วโมง ใจกลางบางแสน จะมาอ่านหนังสือ หรือทำการบ้านก็ชิลล์หมดเพราะมีเครื่องดื่ม ของหวาน และของกินเล่นบริการแบบจัดเต็ม", imageName: "dm5"),
    ]
    
    
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
        dontMissCollectionView.dontMissLocations = dontMissLocations
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
