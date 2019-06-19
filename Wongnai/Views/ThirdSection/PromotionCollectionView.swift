//
//  PromotionCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class PromotionCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    var promotions: [Promotion]? {
        didSet {
            self.hCollectionView.reloadData()
        }
    }
    
    override func setupView() {
        super.setupView()

        self.titleLabel.text = "โปรโมชั่น"
        self.titleLabel.removeFromSuperview()
        self.addSubview(self.titleLabel)
        self.titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        
        self.moreButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        
        self.hCollectionView.removeFromSuperview()
        self.addSubview(self.hCollectionView)
        self.hCollectionView.anchor(top: self.titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0), size: .zero)
        
    }
    
    override func setupCells() {
        self.hCollectionView.register(PromotionCell.self, forCellWithReuseIdentifier: cellID)
    }
}


extension PromotionCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotions?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PromotionCell
        cell.promotion = promotions?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: self.hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}
