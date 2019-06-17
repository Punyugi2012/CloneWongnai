//
//  FirstSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class FirstSectionCell: UICollectionViewCell {
    
    let hContentCollectionView = HContentCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(hContentCollectionView)
        hContentCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 200))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
