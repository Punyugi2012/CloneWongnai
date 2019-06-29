//
//  FifthSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 20/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

protocol ContentImageCollectionPageViewProtocol {
    
    var imageName: String {get set}
    
}

struct Recommend: ContentImageCollectionPageViewProtocol {
    
    var imageName: String
    
}

struct SpecialMeal: ContentImageCollectionPageViewProtocol {
    
    var imageName: String
    
}

class FifthSectionCell: UICollectionViewCell {
    
    let firstPageView: ContentImageCollectionPageView<Recommend> = {
        let pv = ContentImageCollectionPageView<Recommend>()
        pv.titleLabel.text = "ร้านอาหารแนะนำ"
        return pv
    }()
    
    let secondPageView: ContentImageCollectionPageView<SpecialMeal> = {
        let pv = ContentImageCollectionPageView<SpecialMeal>()
        pv.titleLabel.text = "ชวนพิสูจน์ มื้อพิเศษ"
        return pv
    }()
    
    var recommends: [Recommend]? {
        didSet {
            firstPageView.models = recommends
        }
    }
    
    var specialMeals: [SpecialMeal]? {
        didSet {
            secondPageView.models = specialMeals
        }
    }
    
    var firstPageViewHeight: CGFloat? {
        didSet {
            firstPageViewHeightConstraint?.constant = firstPageViewHeight ?? 0
        }
    }
    
    var secondPageViewHeight: CGFloat? {
        didSet {
            secondPageViewHeightConstraint?.constant = secondPageViewHeight ?? 0
        }
    }
    
    var firstPageViewHeightConstraint: NSLayoutConstraint?
    var secondPageViewHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(firstPageView)
        self.addSubview(secondPageView)
        
        
        firstPageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: .zero)
        firstPageViewHeightConstraint = firstPageView.heightAnchor.constraint(equalToConstant: 277)
        firstPageViewHeightConstraint?.isActive = true
        
        secondPageView.anchor(top: firstPageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: .zero)
        secondPageViewHeightConstraint = secondPageView.heightAnchor.constraint(equalToConstant: 277)
        secondPageViewHeightConstraint?.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

