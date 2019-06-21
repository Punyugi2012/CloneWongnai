//
//  HitRestaurantCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 21/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class HitRestaurantCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "food2"))
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let rankView = RankView()
    
    let nameButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isEnabled = false
        button.setTitle("Le Boeuf The Steak & Fries", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setImage(UIImage(named: "check2")?.withRenderingMode(.alwaysOriginal), for: .disabled)
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .bottom
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return button
    }()
    
    let starButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.rgb(205, 18, 1)
        button.isEnabled = false
        button.setTitle("4.0", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setImage(UIImage(named: "star")?.withRenderingMode(.alwaysTemplate), for: .disabled)
        button.tintColor = .white
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(.white, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return button
    }()
    
    let reviewButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isEnabled = false
        button.setTitle("431", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setImage(UIImage(named: "review")?.withRenderingMode(.alwaysTemplate), for: .disabled)
        button.tintColor = .gray
        button.setTitleColor(.gray, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 25)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 130))
        imageView.layer.cornerRadius = 2
        
        
        self.addSubview(rankView)
        rankView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 60, height: 30))
        
        self.addSubview(nameButton)
        nameButton.anchor(top: imageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0), size: .zero)
        
        self.addSubview(starButton)
        starButton.anchor(top: nameButton.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 60, height: 22))
        starButton.layer.cornerRadius = 3
        starButton.clipsToBounds = true
        
        self.addSubview(reviewButton)
        reviewButton.translatesAutoresizingMaskIntoConstraints = false
        reviewButton.leadingAnchor.constraint(equalTo: starButton.trailingAnchor, constant: 10).isActive = true
        reviewButton.centerYAnchor.constraint(equalTo: starButton.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
