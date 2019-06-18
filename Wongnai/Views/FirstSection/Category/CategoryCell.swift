//
//  CategoryCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 18/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "food1"))
        iv.contentMode =  .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ร้านใหม่น่าเช็คอิน"
        label.font = UIFont.getFontSukhumvit(weight: .bold, size: 13)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let newIconLabel = NewIconLabel()
    
    var gradientLayer: CAGradientLayer?
    
    var anchoredNewIcon: NSLayoutConstraint?
    
    var category: Category? {
        didSet {
            imageView.image = UIImage(named: category?.imageName ?? "")
            nameLabel.text = category?.name
            if category?.isNew == false {
                anchoredNewIcon?.constant = -20
                newIconLabel.isHidden = true
            }
            else {
                anchoredNewIcon?.constant = 0
                newIconLabel.isHidden = false
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        self.addSubview(imageView)
        imageView.fillSuperview()
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [UIColor.black.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer?.locations = [0, 0.5, 1.7]
        self.layer.addSublayer(gradientLayer!)
        
        self.addSubview(newIconLabel)
        newIconLabel.font = UIFont.boldSystemFont(ofSize: 14)
        newIconLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0), size: CGSize(width: 50, height: 20))
        
        self.addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 0))
        anchoredNewIcon = nameLabel.topAnchor.constraint(equalTo: newIconLabel.bottomAnchor, constant: 0)
        anchoredNewIcon?.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = self.bounds
    }
    
}
