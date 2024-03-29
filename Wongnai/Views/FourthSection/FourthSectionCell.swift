//
//  FourthSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 20/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class FourthSectionCell: UICollectionViewCell {
    
    let pageView = ContentImagePageView()
    
    let imageNames = ["fc1", "fc2"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(pageView)
        pageView.fillSuperview()
        pageView.imageNames = imageNames
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
