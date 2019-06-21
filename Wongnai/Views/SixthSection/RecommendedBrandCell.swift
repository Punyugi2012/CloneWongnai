//
//  RecommendedBrandCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 21/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class RecommendedBrandCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "rb1"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let adLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    var recommendedBrand: RecommendedBrand? {
        didSet {
            imageView.image = UIImage(named: recommendedBrand?.imageName ?? "")
            adLabel.isHidden = recommendedBrand?.isAd == false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.layer.cornerRadius = 70 / 2
        
        self.addSubview(adLabel)
        adLabel.anchor(top: nil, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
