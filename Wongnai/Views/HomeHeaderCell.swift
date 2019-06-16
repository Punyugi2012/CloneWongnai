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
    
    let cellID = "cellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(imageView)
        
        self.addSubview(collectionView)
        collectionView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 120))
        
        self.addSubview(textField)
        textField.anchor(top: nil, leading: self.leadingAnchor, bottom: self.collectionView.topAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: -20, right: 10), size: CGSize(width: 0, height: 40))
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
