//
//  PromotionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class PromotionCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "place1"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.getFontSukhumvit(weight: .bold, size: 13)
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let checkImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "check"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var promotion: Promotion? {
        didSet {
            imageView.image = UIImage(named: promotion?.imageName ?? "")
            nameLabel.text = promotion?.name
            distanceLabel.text = promotion?.distance.getFormateMeterDistance()
            if promotion?.isCheck == true {
                captionLabel.text = "      " + (promotion?.caption ?? "")
                checkImageView.isHidden = false
            }
            else {
                captionLabel.text = promotion?.caption ?? ""
                checkImageView.isHidden = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 160))
        
        self.addSubview(distanceLabel)
        distanceLabel.anchor(top: imageView.bottomAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: .zero)
        
        self.addSubview(nameLabel)
        nameLabel.anchor(top: imageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: distanceLabel.leadingAnchor, padding: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0.1), size: .zero)
        
        self.addSubview(captionLabel)
        captionLabel.anchor(top: nameLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: .zero)
        
        self.addSubview(checkImageView)
        checkImageView.anchor(top: nameLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: -3, left: 0, bottom: 0, right: 0), size: CGSize(width: 20, height: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
