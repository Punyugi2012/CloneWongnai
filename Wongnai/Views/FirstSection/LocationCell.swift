//
//  LocationCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class LocationCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    var gradientLayer: CAGradientLayer?
    
    var location: Location? {
        didSet {
            imageView.image = UIImage(named: location?.imageName ?? "")
            nameLabel.text = location?.name
            distanceLabel.text = "\(location?.distance ?? 0) ม."
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        self.addSubview(imageView)
        imageView.fillSuperview()
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer?.locations = [0.7, 1]
        self.layer.addSublayer(gradientLayer!)
        
        self.addSubview(distanceLabel)
        distanceLabel.anchor(top: nil, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 3, right: 5), size: .zero)
        
        self.addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: distanceLabel.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 3, right: 0), size: .zero)
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = self.bounds
    }
    
}
