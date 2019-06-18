//
//  CategoryCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 18/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class CategoryCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    let moreCategoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ดูหมวดหมู่ทั้งหมด", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()
    
    var categories: [Category]? {
        didSet {
            hCollectionView.reloadData()
        }
    }
    
    override func setupView() {
        super.setupView()
        moreButton.removeFromSuperview()
        titleLabel.removeFromSuperview()
        hCollectionView.removeFromSuperview()
        self.addSubview(hCollectionView)
        hCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 65, right: 0), size: .zero)
        
        self.addSubview(moreCategoryButton)
        moreCategoryButton.translatesAutoresizingMaskIntoConstraints = false
        moreCategoryButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        moreCategoryButton.topAnchor.constraint(equalTo: hCollectionView.bottomAnchor, constant: 15).isActive = true
    }
    
    override func setupCells() {
        hCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellID)
    }
    
}


extension CategoryCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoryCell
        cell.category = categories?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
    }
    
}
