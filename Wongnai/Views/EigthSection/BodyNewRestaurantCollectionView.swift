//
//  BodyNewRestaurantCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 22/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class BodyNewRestaurantCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    var newRestaurants: [CaptionImage]? {
        didSet {
            self.hCollectionView.reloadData()
        }
    }
    
    override func setupView() {
        super.setupView()
        self.titleLabel.removeFromSuperview()
        self.moreButton.removeFromSuperview()
        self.hCollectionView.removeFromSuperview()
        self.addSubview(self.hCollectionView)
        self.hCollectionView.fillSuperview(padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
    }
    
    override func setupCells() {
        self.hCollectionView.register(BodyNewResCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    
}

extension BodyNewRestaurantCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newRestaurants?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BodyNewResCell
        cell.newRestaurant = newRestaurants?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: self.hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
}
