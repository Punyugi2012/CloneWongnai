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
    
    let makeupStyleMenus: [String] = ["แต่งหน้าไปเรียน/ทำงาน", "แต่งหน้าออกงาน"]
    
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
        ],
        [
            LifeStyleCaptionImage(caption: "แต่งหน้าฉบับเร่งด่วน ด้วยเครื่องสำอาง 7-11", imageName: "ms1"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ แบบไม่กลัวแดด ภายใน 5 นาที!!", imageName: "ms2"),
            LifeStyleCaptionImage(caption: "แต่งหน้าใส ๆ ไปเรียนด้วยเครื่องสำอางในเซเว่น", imageName: "ms3"),
            LifeStyleCaptionImage(caption: "แต่งหน้า แม่หญิงการะเกด ตามหาเนื้อคู่ บุพเพสันนิวาส", imageName: "ms4")
        ]
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(makeupStyleCollectionView)
        makeupStyleCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 350))
        makeupStyleCollectionView.menus = makeupStyleMenus
        makeupStyleCollectionView.lifeStyleCaptionImages = makeupStyles
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
