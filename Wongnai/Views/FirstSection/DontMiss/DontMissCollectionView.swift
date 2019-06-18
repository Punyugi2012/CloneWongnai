//
//  DontMissCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class DontMissCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    let newIconLabel = NewIconLabel()
    
    var dontMissLocations: [DontMissLocation]? {
        didSet {
            self.hCollectionView.reloadData()
        }
    }
        
    override func setupCells() {
        hCollectionView.register(DontMissLocationCell.self, forCellWithReuseIdentifier: cellID)
    }

    
    override func setupView() {
        super.setupView()
        
        self.titleLabel.text = "#ห้ามพลาด"
        self.titleLabel.removeFromSuperview()
        self.addSubview(self.titleLabel)
        titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        
        self.addSubview(newIconLabel)
        newIconLabel.translatesAutoresizingMaskIntoConstraints = false
        newIconLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        newIconLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        newIconLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        newIconLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3).isActive = true
        
        self.moreButton.alpha = 0
        
        self.hCollectionView.removeFromSuperview()
        self.addSubview(hCollectionView)
        self.hCollectionView.anchor(top: self.titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0), size: .zero)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.addSubview(seperatorView)
        seperatorView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 1))
    }
}


extension DontMissCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dontMissLocations?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DontMissLocationCell
        cell.dontMissLocation = dontMissLocations?[indexPath.item]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: hCollectionView.frame.height)
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
    }
}
