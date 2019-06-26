//
//  ContentCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(white: 0.3, alpha: 1)
        return label
    }()
    
    var lifeStyleCaptionImage: LifeStyleCaptionImage? {
        didSet {
            imageView.image = UIImage(named: lifeStyleCaptionImage?.imageName ?? "")
            label.text = lifeStyleCaptionImage?.caption
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 180))
        imageView.layer.cornerRadius = 2
        imageView.clipsToBounds = true
        
        self.addSubview(label)
        label.anchor(top: imageView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
