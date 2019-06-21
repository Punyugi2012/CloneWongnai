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
    
    var recommends: [Recommend]? {
        didSet {
            pageView.recommends = recommends
        }
    }
    
    var firstSubViewHeight: CGFloat? {
        didSet {
            firstSubViewHeightConstraint?.constant = firstSubViewHeight ?? 0
        }
    }
    
    var secondSubViewHeight: CGFloat? {
        didSet {
            
        }
    }
    
    var firstSubViewHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(pageView)
        
        
        pageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: .zero)
        firstSubViewHeightConstraint = pageView.heightAnchor.constraint(equalToConstant: 277)
        firstSubViewHeightConstraint?.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

