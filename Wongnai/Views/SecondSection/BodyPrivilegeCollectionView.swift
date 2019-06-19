//
//  BodyPrivilegeCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class BodyPrivilegeCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"

    var bodyPrivileges: [BodyPrivilege]? {
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
        self.hCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))
    }
    
    override func setupCells() {
        self.hCollectionView.register(BodyPrivilegeCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension BodyPrivilegeCollectionView {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bodyPrivileges?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BodyPrivilegeCell
        cell.bodyPrivilege = bodyPrivileges?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.hCollectionView.frame.height, height: self.hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
