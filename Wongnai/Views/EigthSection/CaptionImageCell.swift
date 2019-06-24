//
//  BodyNewResCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 22/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class CaptionImageCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    let locationNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = UIColor(white: 0, alpha: 0.5)
        label.textAlignment = .center
        return label
    }()
    
    let nBookmarkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    let captionLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
        
    }()
    
    let bookmarkImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "mark")?.withRenderingMode(.alwaysTemplate))
        iv.tintColor = .gray
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var gradientLayer: CAGradientLayer?
    
    var captionImage: CaptionImage? {
        didSet {
            imageView.image = UIImage(named: captionImage?.imageName ?? "")
            
            if let name = captionImage?.name {
                nameLabel.text = name
                nameLabel.alpha = 1
            }
            else {
                nameLabel.alpha = 0
            }
            
            if let locationName = captionImage?.locationName {
                locationNameLabel.alpha = 1
                locationNameLabel.text = locationName
            }
            else {
                locationNameLabel.alpha = 0
            }
            
            if captionImage?.isShowBookmark == true {
                bookmarkImageView.alpha = 1
                nBookmarkLabel.alpha = 1
                nBookmarkLabel.text = "\(captionImage?.nBookmark ?? 0)"
                anchoredConstraintCaptionLabel?.trailing?.constant = -50
            }
            else {
                bookmarkImageView.alpha = 0
                nBookmarkLabel.alpha = 0
                anchoredConstraintCaptionLabel?.trailing?.constant = 0
            }
            
            let attributedString = NSMutableAttributedString(string: "\(captionImage?.caption ?? "")", attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: captionImage?.isAd == true ? UIColor.rgb(37, 121, 195) : .black])
            if captionImage?.isAd == true {
                attributedString.append(NSAttributedString(string: "• [Ad]", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
            }
            captionLabel.attributedText = attributedString
            
        }
    }
    
    var anchoredConstraintCaptionLabel: AnchoredConstraints?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 130))
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer?.locations = [0.4, 1]
        
        self.layer.addSublayer(gradientLayer!)
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        
        containerView.addSubview(bookmarkImageView)
        bookmarkImageView.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: 30, height: 30))
        
        containerView.addSubview(captionLabel)
        anchoredConstraintCaptionLabel = captionLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 50), size: .zero)
        
        containerView.addSubview(nBookmarkLabel)
        nBookmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        nBookmarkLabel.centerXAnchor.constraint(equalTo: bookmarkImageView.centerXAnchor).isActive = true
        nBookmarkLabel.topAnchor.constraint(equalTo: bookmarkImageView.bottomAnchor, constant: 5).isActive = true
        
        self.addSubview(containerView)
        containerView.anchor(top: imageView.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
        
        self.addSubview(nameLabel)
        nameLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: imageView.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10))
        
        self.addSubview(locationNameLabel)
        locationNameLabel.anchor(top: self.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = self.bounds
    }
    
    
}
