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
        let iv = UIImageView(image: nil)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let rankView = RankView()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let starButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.rgb(205, 18, 1)
        button.isEnabled = false
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setImage(UIImage(named: "review")?.withRenderingMode(.alwaysTemplate), for: .disabled)
        button.tintColor = .gray
        button.setTitleColor(.gray, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        return button
    }()
    
    var hitRestaurant: HitRestaurant? {
        didSet {
            imageView.image = UIImage(named: hitRestaurant?.imageName ?? "")

            let nameText = "\(hitRestaurant?.name ?? "")"
            let nameAttributedText = NSMutableAttributedString(string: nameText + " ")
            if hitRestaurant?.isCheck == true {
                let imageAttachment = NSTextAttachment()
                let image = UIImage(named: "check2")!
                imageAttachment.image = image
                imageAttachment.bounds = CGRect(x: 0, y: (nameLabel.font.capHeight - image.size.height).rounded() / 2, width: image.size.width, height: image.size.height)
                nameAttributedText.append(NSAttributedString(attachment: imageAttachment))
            }
            nameLabel.attributedText = nameAttributedText
            
            starButton.setTitle("\(hitRestaurant?.score ?? 0)", for: .normal)
            reviewButton.setTitle("\(hitRestaurant?.nReview ?? 0)", for: .normal)
            rankView.numberLabel.text = "\(hitRestaurant?.rank ?? 0)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 130))
        imageView.layer.cornerRadius = 2
        
        
        self.addSubview(rankView)
        rankView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 60, height: 30))
        
        self.addSubview(nameLabel)
        nameLabel.anchor(top: imageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: .zero)
        

        self.addSubview(starButton)
        starButton.anchor(top: nameLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 60, height: 22))
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
