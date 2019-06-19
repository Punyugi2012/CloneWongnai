//
//  HeaderPrivilegeCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class HeaderPrivilegeCollection: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    var headerPrivileges: [HeaderPrivilege]? {
        didSet {
            self.hCollectionView.reloadData()
        }
    }
    
    override func setupView() {
        super.setupView()
        
        self.titleLabel.text = "สิทธิประโยชน์และส่วนลด"
        self.titleLabel.removeFromSuperview()
        self.addSubview(self.titleLabel)
        self.titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        self.moreButton.alpha = 0
        self.hCollectionView.removeFromSuperview()
        self.addSubview(self.hCollectionView)
        self.hCollectionView.anchor(top: self.titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0), size: .zero)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.addSubview(separatorView)
        separatorView.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 1))
    }
    
    override func setupCells() {
        hCollectionView.register(HeaderPrivilegeCell.self, forCellWithReuseIdentifier: cellID)
    }
    
}

extension HeaderPrivilegeCollection {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerPrivileges?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HeaderPrivilegeCell
        cell.headerPrivilege = headerPrivileges?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 10, height: self.hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}
