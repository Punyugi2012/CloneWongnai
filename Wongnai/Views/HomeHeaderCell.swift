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
        iv.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 200)
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
    
    let cellID = "cellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.addSubview(imageView)
        
        self.addSubview(collectionView)
        collectionView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 100))
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
