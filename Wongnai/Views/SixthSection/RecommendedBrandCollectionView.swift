//
//  RecommendedBrandCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 21/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class RecommenedBrandCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    var recommendedBrands: [RecommendedBrand]? {
        didSet {
            self.hCollectionView.reloadData()
        }
    }
    
    override func setupView() {
        super.setupView()
        titleLabel.text = "แบรนด์แนะนำ"
        self.titleLabel.removeFromSuperview()
        self.addSubview(self.titleLabel)
        self.titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        self.moreButton.alpha = 0
        self.hCollectionView.removeFromSuperview()
        self.addSubview(self.hCollectionView)
        self.hCollectionView.anchor(top: self.titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0))
    }
    
    override func setupCells() {
        self.hCollectionView.register(RecommendedBrandCell.self, forCellWithReuseIdentifier: cellID)
    }
    
}

extension RecommenedBrandCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedBrands?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! RecommendedBrandCell
        cell.recommendedBrand = recommendedBrands?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
