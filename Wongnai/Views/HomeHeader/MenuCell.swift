//
//  MenuCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 16/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.getFontSukhumvit(weight: .medium, size: 13)
        label.textColor = .darkGray
        return label
    }()
    
    var menu: Menu? {
        didSet {
            imageView.image = UIImage(named: menu?.imageName ?? "")
            nameLabel.text = menu?.name
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 35, left: 0, bottom: 20, right: 0)
        self.addSubview(stackView)
        stackView.fillSuperview()
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.addSubview(separatorView)
        separatorView.anchor(top: self.topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 0, bottom: 10, right: 0), size: CGSize(width: 1, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
