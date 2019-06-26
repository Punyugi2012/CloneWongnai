//
//  EleventhSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct Blog {
    
    let title: String
    let subTitle: String
    let imageName: String
}

class EleventhSectionCell: UICollectionViewCell {
    
    let blogCollectionView: ContentVerticalCollectionView = {
        let view = ContentVerticalCollectionView()
        view.titleLabel.text = "ฺBlogs"
        return view
    }()
    
    let blogs: [Blog] = [
        Blog(title: "คนอร์ขวดอวดเมนูเด็ดแชร์ครบ 3 สูตรเด็ดด้วยคนอร์ขวด รับของรางวัลไปเลย!", subTitle: "ส่งสูตรเด็ดของคุณที่ใช้คนอร์ขวด ซอสข้นปรุงรสเป็นส่วนประกอบเพียง 3 สูตร รับเลย! gift voucher 300 บาท", imageName: "b1"),
        Blog(title: "ประกาศรายชื่อผู้ได้รับรางวัลกิจกรรมเข้าครัวแชร์สูตร รับฟรี 2 ต่อ!", subTitle: "ประกาศรายชื่อผู้ได้รับรางวัลกิจกรรมเข้าครัวแชร์สูตร รับฟรี 2 ต่อ!", imageName: "b2"),
        Blog(title: "แชร์ครบ 3 สูตร รับฟรีทันที! บัตร Tops Supermarket", subTitle: "ชวนชาวก้นครัวมาร่วมแชร์สูตรอาหารเด็ด ๆ ที่คุณทำเองบน Wongnai Cooking กับกิจกรรมแชร์สูตรเด็ด มีของดีต้องแชร์", imageName: "b3")
    
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(blogCollectionView)
        blogCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 370))
        blogCollectionView.blogs = blogs
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
