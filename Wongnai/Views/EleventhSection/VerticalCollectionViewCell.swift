//
//  VerticalCollectionViewCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.rgb(37, 121, 195)
        label.numberOfLines = 3
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(white: 0.3, alpha: 1)
        return label
    }()
    
    var blog: Blog? {
        didSet {
            imageView.image = UIImage(named: blog?.imageName ?? "")
            titleLabel.text = blog?.title
            subTitleLabel.text = blog?.subTitle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 80, height: 80))
        imageView.layer.cornerRadius = 2
    
        self.addSubview(titleLabel)
        titleLabel.anchor(top: self.topAnchor, leading: imageView.trailingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5), size: .zero)
        
        self.addSubview(subTitleLabel)
        subTitleLabel.anchor(top: self.titleLabel.bottomAnchor, leading: imageView.trailingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5), size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
