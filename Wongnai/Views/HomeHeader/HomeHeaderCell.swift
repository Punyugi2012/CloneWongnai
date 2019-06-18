//
//  HomeHeaderCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 16/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct Menu {
    let imageName: String
    let name: String
}

class HomeHeaderCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "fastfood"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 230)
        return iv
    }()
    
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.15)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
        cv.showsHorizontalScrollIndicator = false
        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        return cv
    }()
    
    let textField: UITextField = {
        
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "ร้านอาหาร, เสริมสวย, สปา, ย่าน, ..."
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOpacity = 0.3
        tf.layer.shadowOffset = CGSize(width: 0, height: -2)
        tf.layer.shadowRadius = 6
        
        let leftImageView = UIImageView(image: UIImage(named: "search")?.withRenderingMode(.alwaysTemplate))
        leftImageView.tintColor = .gray
        leftImageView.contentMode = .right
        leftImageView.frame = CGRect(x: 0, y: 0, width: leftImageView.image!.size.width + 10, height: leftImageView.image!.size.height)
        
        let rightImageView =  UIImageView(image: UIImage(named: "map")?.withRenderingMode(.alwaysTemplate))
        rightImageView.tintColor = .gray
        rightImageView.contentMode = .left
        rightImageView.frame = CGRect(x: 0, y: 0, width: rightImageView.image!.size.width + 10, height: rightImageView.image!.size.height)
        
        tf.leftView = leftImageView
        tf.rightView = rightImageView
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        tf.addSubview(view)
        view.anchor(top: tf.topAnchor, leading: nil, bottom: tf.bottomAnchor, trailing: tf.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: rightImageView.frame.width + 10), size: CGSize(width: 1, height: 0))

        return tf
        
    }()
    
    let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "fast food โดย Punyugi2012"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let nearMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ใกล้ฉัน", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.titleLabel?.font = UIFont.getFontSukhumvit(weight: .bold, size: 14)
        button.setImage(UIImage(named: "arrow_down")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let cellID = "cellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(imageView)
        
        self.addSubview(blackView)
        blackView.fillSuperview()
        
        let collectionContainerView = UIView()
        collectionContainerView.layer.shadowColor = UIColor.white.cgColor
        collectionContainerView.layer.shadowOpacity = 1
        collectionContainerView.layer.shadowOffset = CGSize(width: 0, height: -22)
        collectionContainerView.layer.shadowRadius = 6

        self.addSubview(collectionContainerView)
        collectionContainerView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 120))
        
        collectionContainerView.addSubview(collectionView)
        collectionView.fillSuperview()
        
        self.addSubview(textField)
        textField.anchor(top: nil, leading: self.leadingAnchor, bottom: self.collectionView.topAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: -20, right: 10), size: CGSize(width: 0, height: 40))
        
        self.addSubview(captionLabel)
        captionLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: textField.topAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0), size: .zero)
        
        self.addSubview(nearMeButton)
        nearMeButton.translatesAutoresizingMaskIntoConstraints = false
        nearMeButton.widthAnchor.constraint(equalToConstant: 95).isActive = true
        nearMeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nearMeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nearMeButton.bottomAnchor.constraint(equalTo: captionLabel.topAnchor, constant: -50).isActive = true
        nearMeButton.layer.cornerRadius = 30 / 2
        nearMeButton.clipsToBounds = true
        
        self.addSubview(closeButton)
        closeButton.anchor(top: nil, leading: nearMeButton.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 44, height: 44))
        closeButton.centerYAnchor.constraint(equalTo: nearMeButton.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let menus: [Menu] = [
        Menu(imageName: "near", name: "ใกล้ฉัน"),
        Menu(imageName: "restaurant", name: "ร้านอาหาร"),
        Menu(imageName: "travel", name: "ที่เที่ยว"),
        Menu(imageName: "room", name: "ที่พัก"),
        Menu(imageName: "deal", name: "ดีล"),
        Menu(imageName: "user_choice", name: "Users' Choice")
    ]
    
}

extension HomeHeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.menu = menus[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
   
    
    
}
