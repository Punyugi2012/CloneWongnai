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
    
    let headerPageView: ContentCaptionImagePageView = {
        let view = ContentCaptionImagePageView()
        view.titleLabel.text = "ร้านอาหารใหม่ และน่าสนใจ ในชลบุรี"
        return view
    }()
    
    let bodyCollectionView = ContentCaptionImageCollectionView(isShowHeaderControls: false)
    
    let restaurantCluesCollectionView: ContentCaptionImageCollectionView = {
        let view = ContentCaptionImageCollectionView(isShowHeaderControls: true)
        view.titleLabel.text = "ลายแทงร้านอาหารในชลบุรี"
        return view
    }()
    
    let interestingTripsPageView: ContentCaptionImagePageView = {
        let view = ContentCaptionImagePageView()
        view.moreButton.isHidden = true
        view.titleLabel.text = "ทริป ที่พักและสถานที่่ท่องเที่ยวที่น่าสนใจ"
        return view
    }()
    
    let tripCollectionView: ContentCaptionImageCollectionView = {
        let view = ContentCaptionImageCollectionView(isShowHeaderControls: true)
        view.titleLabel.text = "ทริปกินเที่ยว"
        return view
    }()
    
    let recommendedLocationCollectionView: ContentCaptionImageCollectionView = {
        let view = ContentCaptionImageCollectionView(isShowHeaderControls: true)
        view.titleLabel.text = "แนะนำที่พัก และสถานที่ท่องเที่ยว"
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
    
    let interestingTrips: [CaptionImage] = [
        CaptionImage(name: nil, caption: "2 วัน 1 คืน เที่ยวธรรมชาติรอบโคราช หน้าฝนก็เที่ยวได้", locationName: "เมืองนครราชศรีมา", isAd: false, nBookmark: 0, imageName: "it1", isShowBookmark: false),
        CaptionImage(name: nil, caption: "นอนแพ ล่องลำน้ำซองกาเรีย เที่ยวสังขละบุรีในสายฝน", locationName: nil, isAd: false, nBookmark: 0, imageName: "it2", isShowBookmark: false),
        CaptionImage(name: nil, caption: "เช็กอินที่เที่ยวจันทบุรีแบบชีวีตดี๊ดี เพราะเรามาเที่ยววันธรรมดา!", locationName: "เมืองจันทบุรี", isAd: false, nBookmark: 0, imageName: "it3", isShowBookmark: false)
    ]
    
    let trips: [CaptionImage] = [
        CaptionImage(name: "J-Park Sriraha Nihon Mura", caption: "เจพาร์ค ศรีราชา นิฮอน มูระ Community Mall สไตล์ญี่ปุ่น ครบจบในที่เดียว", locationName: "หนองขาม", isAd: true, nBookmark: 40, imageName: "t1", isShowBookmark: true),
        CaptionImage(name: "สถานีรถไฟธนบุรี", caption: "นั่งรถไฟเช็กอินที่เที่ยวนครปฐม กินเที่ยวครบงบ 500 ยังเหลือ!", locationName: "บางกอกน้อย", isAd: false, nBookmark: 7, imageName: "t2", isShowBookmark: true),
        CaptionImage(name: "วัดโกรกกราก", caption: "เที่ยวใกล้กรุง ชิมกาแฟมะพร้าว ชมสวน ชิลบนสะพาน ลุยเที่ยวสมุทรสาคร", locationName: "เมืองสมุทรสาคร", isAd: false, nBookmark: 9, imageName: "t3", isShowBookmark: true)
    ]
    
    let recommendedLocations: [CaptionImage] = [
        CaptionImage(name: nil, caption: "10 ที่เที่ยวเหนือฉ่ำใจ ที่เที่ยวใต้สุดฟิน วันหยุดนี้ต้องไปเช็กอิน!", locationName: nil, isAd: false, nBookmark: 0, imageName: "rl1", isShowBookmark: false),
        CaptionImage(name: nil, caption: "10 ที่พักระยองดีไซน์สวยบรรยากาศดี ซัมเมอร์นี้ต้องไป...เช็กอิน!", locationName: nil, isAd: false, nBookmark: 0, imageName: "rl2", isShowBookmark: false),
        CaptionImage(name: nil, caption: "ไม่ไปถือว่าพลาด! 10 ที่เที่ยวคลายร้อนทั่วไทย ซัมเมอร์นี้ต้องไปเช็คอิน!", locationName: nil, isAd: false, nBookmark: 0, imageName: "rl3", isShowBookmark: false),
    ]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(headerPageView)
        headerPageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 400))
        headerPageView.captionImages = headerNewRestaurants
        
        self.addSubview(bodyCollectionView)
        bodyCollectionView.anchor(top: headerPageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220))
        bodyCollectionView.captionImages = bodyNewRestaurants
        
        self.addSubview(restaurantCluesCollectionView)
        restaurantCluesCollectionView.anchor(top: bodyCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220 + 50))
        restaurantCluesCollectionView.captionImages = restaurantClues
        
        self.addSubview(interestingTripsPageView)
        interestingTripsPageView.anchor(top: restaurantCluesCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 400))
        interestingTripsPageView.captionImages = interestingTrips
        
        self.addSubview(tripCollectionView)
        tripCollectionView.anchor(top: interestingTripsPageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220 + 50))
        tripCollectionView.captionImages = trips
        
        self.addSubview(recommendedLocationCollectionView)
        recommendedLocationCollectionView.anchor(top: tripCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220 + 50))
        recommendedLocationCollectionView.captionImages = recommendedLocations
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
