//
//  NinethSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class NinethSectionCell: UICollectionViewCell {
    
    let recipeKnorrPageView: ContentCaptionImagePageView = {
        let view = ContentCaptionImagePageView(isShowLogo: true)
        view.titleLabel.text = "รวมสูตรน่ากิน ฟินทุกจาน โดย knorr"
        return view
    }()
    
    let collectRecipePageView: ContentCaptionImagePageView = {
        let view = ContentCaptionImagePageView(isShowLogo: false)
        view.titleLabel.text = "รวมสูตรเมนูอาหารทำง่ายและเกร็ดน่ารู้"
        return view
    }()
    
    let collectRecipeCollectionView: ContentCaptionImageCollectionView = {
        let view = ContentCaptionImageCollectionView(isShowHeaderControls: false)
        return view
    }()
    
    let foodKnowledgeCollectionView: ContentCaptionImageCollectionView = {
        let view = ContentCaptionImageCollectionView(isShowHeaderControls: true)
        view.titleLabel.text = "เกร็ดความรู้เรื่องอาหาร"
        return view
    }()
    
    let knorrRecipes: [CaptionImage] = [
        CaptionImage(name: nil, caption: "วิธีทำ \"ลาซานญ่าบะหมี่กึ่งสำเร็จรูป\" เมนูอบชีสเยิ้ม ทำง่าย ๆ ที่บ้าน", locationName: nil, isAd: true, nBookmark: 0, imageName: "recipe1", isShowBookmark: false),
        CaptionImage(name: nil, caption: "วิธีทำ \"ข้าวผัดไข่แฮม\" เมนูผัดเสิร์ฟร้อน หอมยั่วใจ มื้อไหนก็ฟิน", locationName: nil, isAd: true, nBookmark: 0, imageName: "recipe2", isShowBookmark: false),
        CaptionImage(name: nil, caption: "วิธีทำ \"บะหมี่หน้าหมูซอสข้นไข่ออนเซ็น\" เมนูเส้นนุ่ม เนื้อหมูชุ่มฉ่ำ", locationName: nil, isAd: true, nBookmark: 0, imageName: "recipe3", isShowBookmark: false)
    ]
    
    let headerRecipes: [CaptionImage] = [
        CaptionImage(name: nil, caption: "วิธีทำ \"เกี๊ยวกุ้งนึ่ง\" เมนูกุ้งเนื้อเด้ง ทำกินเองง่าย ๆ ได้ที่บ้าน!", locationName: nil, isAd: true, nBookmark: 0, imageName: "cr1", isShowBookmark: false),
        CaptionImage(name: nil, caption: "วิธีทำ \"ลาบเครื่องในเป็ด\" เมนูเป็ดรสแซ่บแค่เห็นก็ซี้ดน้ำลายกระเซ็น", locationName: nil, isAd: true, nBookmark: 0, imageName: "cr2", isShowBookmark: false),
        CaptionImage(name: nil, caption: "วิธีทำ \"ลาซานญ่าบะหมี่กึ่งสำเร็จรูป\" เมนูอบชีสเยิ้ม ทำง่าย ๆ ที่บ้าน", locationName: nil, isAd: true, nBookmark: 0, imageName: "cr3", isShowBookmark: false),
    ]
    
    let bodyRecipes: [CaptionImage] = [
        CaptionImage(name: nil, caption: "วิธีทำ \"หมั่นโถวขาหมูพะโล้\" เมนูอาหารจีนรสเข้มข้น ทำง่ายไม่กี่ขั้นตอน!", locationName: nil, isAd: true, nBookmark: 0, imageName: "cr4", isShowBookmark: false),
        CaptionImage(name: nil, caption: "วิธีทำ \"สเต๊กปลาแซลมอน\" เมนูปลาชิ้นโต ทำกินง่าย ทำขายคล่อง!", locationName: nil, isAd: true, nBookmark: 0, imageName: "cr5", isShowBookmark: false),
        CaptionImage(name: nil, caption: "วิธีทำ \"อกเป็ดราดซอสส้ม\" เมนูอาหารฝรั่งเนื้อนุ่ม ๆ ราดซอสชุ่มฉ่ำ!", locationName: nil, isAd: true, nBookmark: 0, imageName: "cr6", isShowBookmark: false)
    ]
    
    let foodKnowledges: [CaptionImage] = [
        CaptionImage(name: nil, caption: "6 สูตรหมักหมูกระทะ หมูจุ่มนุ่มลิ้น ฟินสะเด่ารสเข้าเนื้อ", locationName: nil, isAd: true, nBookmark: 0, imageName: "fk1", isShowBookmark: false),
        CaptionImage(name: nil, caption: "แจกสูตร 5 เมนูสุขภาพจากผักตามฤดูกาล ประโยชน์มากมาย อิ่มกายสบายพุง!", locationName: nil, isAd: true, nBookmark: 0, imageName: "fk2", isShowBookmark: false),
        CaptionImage(name: nil, caption: "แจกสูตร 5 เมนูสุขภาพจาก “ผักพื้นบ้าน” ทำกินง่าย ทำขายเลิศ!", locationName: nil, isAd: true, nBookmark: 0, imageName: "fk3", isShowBookmark: false)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(recipeKnorrPageView)
        recipeKnorrPageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 400))
        recipeKnorrPageView.captionImages = knorrRecipes
        
        self.addSubview(collectRecipePageView)
        collectRecipePageView.anchor(top: recipeKnorrPageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 400))
        collectRecipePageView.captionImages = headerRecipes
        
        self.addSubview(collectRecipeCollectionView)
        collectRecipeCollectionView.anchor(top: collectRecipePageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220))
        collectRecipeCollectionView.captionImages = bodyRecipes
        
        self.addSubview(foodKnowledgeCollectionView)
        foodKnowledgeCollectionView.anchor(top: collectRecipeCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 220 + 50))
        foodKnowledgeCollectionView.captionImages = foodKnowledges
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
