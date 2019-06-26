//
//  ContentNavBarCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class ContentNavBarCollectionView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getFontSukhumvit(weight: .bold, size: 16)
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ดูทั้งหมด", for: .normal)
        button.titleLabel?.font = UIFont.getFontSukhumvit(weight: .medium, size: 14)
        button.setTitleColor(UIColor.rgb(37, 121, 195), for: .normal)
        return button
    }()
    
    let navBarController = NavBarController(collectionViewLayout: UICollectionViewFlowLayout())
    
    let collectionViewContainerView = CollectionViewContainerView()
    
    var menus: [String]? {
        didSet {
            navBarController.menus = menus
            collectionViewContainerView.menus = menus
        }
    }
    
    var lifeStyleCaptionImages: [[LifeStyleCaptionImage]]? {
        didSet {
            collectionViewContainerView.lifeStyleCaptionImages = lifeStyleCaptionImages
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        
        self.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        
        self.addSubview(navBarController.view)
        navBarController.view.anchor(top: titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 50))
        
        self.addSubview(collectionViewContainerView)
        collectionViewContainerView.anchor(top: navBarController.view.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 250))
        
        navBarController.delegate = collectionViewContainerView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

