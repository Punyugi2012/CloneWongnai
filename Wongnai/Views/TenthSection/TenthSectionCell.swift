//
//  TenthSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit


struct LifeStyleCaptionImage {
    
    let caption: String
    let imageName: String
    
}

class TenthSectionCell: UICollectionViewCell {
    
    let makeupStyleCollectionView: ContentNavBarCollectionView = {
        let view = ContentNavBarCollectionView()
        view.titleLabel.text = "รวมสไตล์การแต่งหน้า"
        return view
    }()
    
    let recommendHairStyleCollectionView: ContentNavBarCollectionView = {
        let view = ContentNavBarCollectionView()
        view.titleLabel.text = "ทรงผมแนะนำ"
        return view
    }()
    
    let makeupStyleMenus: [String] = ["แต่งหน้าไปเรียน/ทำงาน", "แต่งหน้าออกงาน"]
    
    let hairStyleMenus: [String] = ["ทรงผมสั้น", "ทรงผมยาว", "ทรงผมชาย", "ผมทำสี"]
    
    let makeupStyles: [[LifeStyleCaptionImage]] = [
        [
            LifeStyleCaptionImage(caption: "แต่งหน้าฉบับเร่งด่วน ด้วยเครื่องสำอาง 7-11", imageName: "ms1"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ แบบไม่กลัวแดด ภายใน 5 นาที!!", imageName: "ms2"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ ไปเรียนด้วยเครื่องสำอางในเซเว่น", imageName: "ms3"),
            LifeStyleCaptionImage(caption: "แต่งหน้า แม่หญิงการะเกด ตามหาเนื้อคู่ บุพเพสันนิวาส", imageName: "ms4"),
            LifeStyleCaptionImage(caption: "แต่งหน้าฉบับเร่งด่วน ด้วยเครื่องสำอาง 7-11", imageName: "ms1"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ แบบไม่กลัวแดด ภายใน 5 นาที!!", imageName: "ms2"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ ไปเรียนด้วยเครื่องสำอางในเซเว่น", imageName: "ms3"),
            LifeStyleCaptionImage(caption: "แต่งหน้า แม่หญิงการะเกด ตามหาเนื้อคู่ บุพเพสันนิวาส", imageName: "ms4"),
            LifeStyleCaptionImage(caption: "แต่งหน้าฉบับเร่งด่วน ด้วยเครื่องสำอาง 7-11", imageName: "ms1"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ แบบไม่กลัวแดด ภายใน 5 นาที!!", imageName: "ms2"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ ไปเรียนด้วยเครื่องสำอางในเซเว่น", imageName: "ms3"),
            LifeStyleCaptionImage(caption: "แต่งหน้า แม่หญิงการะเกด ตามหาเนื้อคู่ บุพเพสันนิวาส", imageName: "ms4"),
        ],
        [
            LifeStyleCaptionImage(caption: "แต่งหน้าสาย ฝ. ด้วยงบหลักร้อย!!", imageName: "ms5"),
            LifeStyleCaptionImage(caption: "แต่งหน้ารับวาเลนไทน์ หวานฉ่ำไปออกเดท", imageName: "ms6"),
            LifeStyleCaptionImage(caption: "แต่งหน้าสวยหวาน เทรนด์สาวเกาหลี", imageName: "ms7"),
            LifeStyleCaptionImage(caption: "ทาลิปสติกอย่างไร ให้ปากสวยอวบอิ่มแบบ Lisa Blackpink", imageName: "ms8")
        ]
    ]
    
    let hairStyles: [[LifeStyleCaptionImage]] = [
        [
            LifeStyleCaptionImage(caption: "ผมดัดลอนใหญ่ สไตล์ญี่ปุ่น", imageName: "hs1"),
            LifeStyleCaptionImage(caption: "ผมลอนมาม่า ความยาวประบ่า", imageName: "hs2"),
            LifeStyleCaptionImage(caption: "ผมลอนฟาร่าแบบซอฟต์ ๆ", imageName: "hs3"),
            LifeStyleCaptionImage(caption: "ผมดัดลอนสั้นลอนใหญ่", imageName: "hs4"),
        ],
        [
            LifeStyleCaptionImage(caption: "ทรงผมปล่อยม้วนลอนบิดเกลียว", imageName: "hs5"),
            LifeStyleCaptionImage(caption: "ทรงผมบิดเกลียวสำหรับผมสั้น", imageName: "hs6"),
            LifeStyleCaptionImage(caption: "ทรงผมปล่อยลอนฟาร่า", imageName: "hs7"),
            LifeStyleCaptionImage(caption: "ทรงผมลอนเปียกแบบสาวแกสบี้", imageName: "hs8"),
        ],
        [
            LifeStyleCaptionImage(caption: "ทรงผมรองทรง", imageName: "hs9"),
            LifeStyleCaptionImage(caption: "ทรงผม Under Cut ผมด้านบนยาว", imageName: "hs10"),
            LifeStyleCaptionImage(caption: "ทรงผม Lay Cut", imageName: "hs11"),
            LifeStyleCaptionImage(caption: "ทรงผมสไลซ์เพิ่มวอลลุ่มด้านบน", imageName: "hs12"),
        ],
        [
            LifeStyleCaptionImage(caption: "Ash Brown", imageName: "hs13"),
            LifeStyleCaptionImage(caption: "Purple Brown", imageName: "hs14"),
            LifeStyleCaptionImage(caption: "Dark Chocolate Brown", imageName: "hs15"),
            LifeStyleCaptionImage(caption: "Bambi Brown", imageName: "hs16"),
        ]
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(makeupStyleCollectionView)
        makeupStyleCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 350))
        makeupStyleCollectionView.menus = makeupStyleMenus
        makeupStyleCollectionView.lifeStyleCaptionImages = makeupStyles
        self.addSubview(recommendHairStyleCollectionView)
        recommendHairStyleCollectionView.anchor(top: makeupStyleCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 350))
        recommendHairStyleCollectionView.menus = hairStyleMenus
        recommendHairStyleCollectionView.lifeStyleCaptionImages = hairStyles
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
