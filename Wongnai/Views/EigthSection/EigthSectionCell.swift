//
//  EigthSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 22/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct CaptionImage {
    
    let name: String?
    let caption: String
    let locationName: String?
    let isAd: Bool
    let nBookmark: Int
    let imageName: String
    let isShowBookmark: Bool
    
}

class EigthSectionCell: UICollectionViewCell {
    
    let headerPageView = ContentCaptionImagePageView()
    
    let bodyCollectionView = ContentCaptionImageCollectionView(isShowHeaderControls: false)
    
    let restaurantCluesCollectionView: ContentCaptionImageCollectionView = {
        let view = ContentCaptionImageCollectionView(isShowHeaderControls: true)
        view.titleLabel.text = "ลายแทงร้านอาหารในชลบุรี"
        return view
    }()
    
    let headerNewRestaurants: [CaptionImage] = [
        CaptionImage(name: "อาหารไทย เพื่อนรัก ราชเทวี", caption: "[รีวิว] \"เพื่อนรัก\" ร้านอาหารไทย รสชาติอาหารพื้นเมืองแม้ ที่ยากจะหาทาน", locationName: "ราชเทวี", isAd: false, nBookmark: 41, imageName: "nr1", isShowBookmark: true),
        CaptionImage(name: "รีน่าเบเกอรี่", caption: "[รีวิว] รีน่า เบเกอรี ร้านขนมอบเก่าแก่ราคาหลักสิบ ตัวแม่เรื่องเมอแรงก์", locationName: "คลองเตย", isAd: false, nBookmark: 26, imageName: "nr2", isShowBookmark: true),
        CaptionImage(name: "Fogo Asia", caption: "[รีวิว] Fogo Asia สเต็กเฮ็าส์สไตล์บราซิล บุฟเฟ่ต์เนื้อย่างไม่จำกัดเวลา", locationName: "พร้อมพงษ์", isAd: true, nBookmark: 218, imageName: "nr3", isShowBookmark: true)
    ]
    
    let bodyNewRestaurants: [CaptionImage] = [
        CaptionImage(name: "อาหารไทย เพื่อนรัก ราชเทวี", caption: "[รีวิว] \"เพื่อนรัก\" ร้านอาหารไทย รสชาติอาหารพื้นเมืองแม้ ที่ยากจะหาทาน", locationName: "ราชเทวี", isAd: false, nBookmark: 41, imageName: "nr1", isShowBookmark: true),
        CaptionImage(name: "รีน่าเบเกอรี่", caption: "[รีวิว] รีน่า เบเกอรี ร้านขนมอบเก่าแก่ราคาหลักสิบ ตัวแม่เรื่องเมอแรงก์", locationName: "คลองเตย", isAd: false, nBookmark: 26, imageName: "nr2", isShowBookmark: true),
        CaptionImage(name: "Fogo Asia", caption: "[รีวิว] Fogo Asia สเต็กเฮ็าส์สไตล์บราซิล บุฟเฟ่ต์เนื้อย่างไม่จำกัดเวลา", locationName: "พร้อมพงษ์", isAd: true, nBookmark: 218, imageName: "nr3", isShowBookmark: true)
    ]
    
    
    let restaurantClues: [CaptionImage] = [
        CaptionImage(name: nil, caption: "12 ร้านอาหารไทย ทีเด็ดรสจัดจ้าน บรรยากาศน่านั่งชิลล์!", locationName: nil, isAd: false, nBookmark: 0, imageName: "cres1", isShowBookmark: false),
        CaptionImage(name: nil, caption: "10 ร้านบุฟเฟ่ต์ชาบู อิ่มคุ้มแบบจัดหนัก ระดับพรีเมียม!", locationName: nil, isAd: false, nBookmark: 0, imageName: "cres2", isShowBookmark: false),
        CaptionImage(name: nil, caption: "10 ร้านชานมไข่มุกไต้หวัน หอมชาเข้ม เนื้อมุกหนึบ จนต้องเบิล!", locationName: nil, isAd: false, nBookmark: 0, imageName: "cres3", isShowBookmark: false)
    ]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(headerPageView)
        headerPageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 400))
        headerPageView.captionImages = headerNewRestaurants
        
        self.addSubview(bodyCollectionView)
        bodyCollectionView.anchor(top: headerPageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220))
        bodyCollectionView.captionImages = bodyNewRestaurants
        
        self.addSubview(restaurantCluesCollectionView)
        restaurantCluesCollectionView.anchor(top: bodyCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220 + 50))
        restaurantCluesCollectionView.captionImages = restaurantClues
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
