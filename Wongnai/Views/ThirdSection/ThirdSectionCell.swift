//
//  ThirdSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct Promotion {
    
    let name: String
    let distance: Int
    let caption: String
    let imageName: String
    let isCheck: Bool
    
}

class ThirdSectionCell: UICollectionViewCell {
    
    let promotionCollectionView = PromotionCollectionView()
    
    let promotions: [Promotion] = [
        Promotion(name: "X' Cucine Bistro&cafe", distance: 1000, caption: "สำหรับเมนูกุ้งแม่น้ำนำเข้าภายในสัปดาห์นี้ เมื่อทานที่ร้าน (จำนวนจำกัด) • หมดอายุในอีก 3 วัน อ่านต่อได้ที่", imageName: "p1", isCheck: true),
        Promotion(name: "ข้าวขาหมู เฮียพล", distance: 2000, caption: "เพียงสั่งผ่านวงใน ไลน์แมน เมนูอะไรก็ได้ในร้านครบ199 รับฟรี 🎉🎉เอสโคล่า490มล. 🎉🎉(จนกว่าของแถมจะหมด) • หมดอายุวันที่ 30 มิ.ย. 2019", imageName: "p2", isCheck: true),
        Promotion(name: "หมูทอด ณ เจริญนคร หมูทอด ณ เจริญนคร", distance: 3000, caption: "โปรโมชั่น น้ำแตงโมปั่น ลดราคาจาก 35 บาท เหลือ 25 บาท • หมดอายุวันที่ 31 ก.ค. 2019", imageName: "p3", isCheck: false),
        Promotion(name: "Lily Cafe Lily House", distance: 4000, caption: "โปรโมชั่น Lily Gift Voucher ลด 300 บาท เมื่อสั่งเมนูในหมวด Sparkling Soda, Cold Drinks , Ice-Cream, Pastry, Coffee Beans, Cake&Pie, Hot Drinks", imageName: "p4", isCheck: false),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(promotionCollectionView)
        promotionCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: self.frame.height))
        promotionCollectionView.promotions = promotions
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
