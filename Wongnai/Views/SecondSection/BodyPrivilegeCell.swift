//
//  BodyPrivilegeCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class BodyPrivilegeCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.getFontSukhumvit(weight: .bold, size: 15)
        label.textAlignment = .center
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var bodyPrivilege: BodyPrivilege? {
        didSet {
            imageView.image = UIImage(named: bodyPrivilege?.imageName ?? "")
            titleLabel.text = bodyPrivilege?.title
            subTitleLabel.text = bodyPrivilege?.subTitle
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
        self.layer.borderWidth = 1
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.addSubview(titleLabel)
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 30))
        containerView.addSubview(subTitleLabel)
        subTitleLabel.anchor(top: titleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .zero, size: .zero)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, containerView])
        stackView.axis = .vertical
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.addSubview(stackView)
        stackView.fillSuperview()
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        containerView.addSubview(separatorView)
        separatorView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 1))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
