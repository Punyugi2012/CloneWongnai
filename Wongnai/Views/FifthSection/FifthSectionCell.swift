//
//  FifthSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 20/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct Recommend {
    
    let imageName: String
    
}

class FifthSectionCell: UICollectionViewCell {
    
    let pageView = ContentPageView2()
    
//    let recommends: [Recommend] = [
//        Recommend(imageName: "rc1"),
//        Recommend(imageName: "rc2"),
//        Recommend(imageName: "rc3"),
//        Recommend(imageName: "rc4"),
//        Recommend(imageName: "rc5"),
//        Recommend(imageName: "rc6")
//    ]

    let recommends: [Recommend] = [
        Recommend(imageName: "rc1"),
        Recommend(imageName: "rc2"),
        Recommend(imageName: "rc3"),
        Recommend(imageName: "rc4"),
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(pageView)
        
        var pageViewHeight: CGFloat = 277
        if Double(recommends.count) / 4.0 <= 1  {
            pageViewHeight -= 17
        }
//        self.frame.size.height = pageViewHeight
//        print(pageViewHeight)
//        print(self.frame.height)
        pageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: pageViewHeight))
        pageView.recommends = recommends
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

