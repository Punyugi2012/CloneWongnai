//
//  DontMissLocation.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class DontMissLocationCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let captionLabel: UILabel = {
        let tv = UILabel()
        tv.text = ""
        tv.textColor = .white
        tv.font = UIFont.systemFont(ofSize: 12)
        tv.numberOfLines = 2
        return tv
    }()
    
    var gradientLayer: CAGradientLayer?
    
    var dontMissLocation: DontMissLocation? {
        didSet {
            imageView.image = UIImage(named: dontMissLocation?.imageName ?? "")
            nameLabel.text = dontMissLocation?.name
            captionLabel.text = dontMissLocation?.caption
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        self.addSubview(imageView)
        imageView.fillSuperview()
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer?.locations = [-0.5, 0.5]
        self.layer.addSublayer(gradientLayer!)
        
        self.addSubview(nameLabel)
        nameLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5), size: .zero)
        
        self.addSubview(captionLabel)
        captionLabel.anchor(top: nameLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 2, left: 5, bottom: 0, right: 5), size: CGSize(width: 0, height: 40))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = self.bounds
    }
    
}
