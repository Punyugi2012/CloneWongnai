//
//  LastContentCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class LastContentCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    let allLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    var menu: String? {
        didSet {
            allLabel.text = "All \n\(menu ?? "")"
        }
    }
    
    var lifeStyleCaptionImage: LifeStyleCaptionImage? {
        didSet {
            imageView.image = UIImage(named: lifeStyleCaptionImage?.imageName ?? "")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 180))
        imageView.layer.cornerRadius = 2
        imageView.clipsToBounds = true
        
        self.addSubview(backView)
        backView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 180))
        backView.layer.cornerRadius = 2
        backView.clipsToBounds = true
        
        self.addSubview(allLabel)
        allLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), size: CGSize(width: 0, height: 180))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

