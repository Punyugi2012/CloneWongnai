//
//  HitRestaurantCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 21/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class HitRestaurantCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    var hitRestaurants: [HitRestaurant]? {
        didSet {
            self.hCollectionView.reloadData()
        }
    }
    
    override func setupView() {
        super.setupView()
        titleLabel.text = "ร้านอาหารยอดนิยม ในกรุงเทพและปริมณฑล"
        self.titleLabel.removeFromSuperview()
        self.addSubview(self.titleLabel)
        self.titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        self.moreButton.alpha = 1
        self.moreButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        self.hCollectionView.removeFromSuperview()
        self.addSubview(self.hCollectionView)
        self.hCollectionView.anchor(top: self.titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    override func setupCells() {
        self.hCollectionView.register(HitRestaurantCell.self, forCellWithReuseIdentifier: cellID)
    }
    
}

extension HitRestaurantCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hitRestaurants?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HitRestaurantCell
        cell.hitRestaurant = hitRestaurants?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}

