//
//  HContentCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class NearShop_HitNearCollectionView: BaseHContentCollectionView {
    
    var overAllLocation: OverAllLocation? {
        didSet {
            hCollectionView.reloadData()
        }
    }
    
    let firstCellID = "firstCellID"
    let nextCellID = "cellID"
    
    override func setupCells() {
        hCollectionView.register(NearLandmarkLocationCell.self, forCellWithReuseIdentifier: firstCellID)
        hCollectionView.register(NearLocationCell.self, forCellWithReuseIdentifier: nextCellID)
    }
    
}


extension NearShop_HitNearCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let overAllLocation = self.overAllLocation, overAllLocation.landmarkLocation != nil {
            return overAllLocation.locations.count + 1
        }
        return overAllLocation?.locations.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0, let landmarkLocation = overAllLocation?.landmarkLocation  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellID, for: indexPath) as! NearLandmarkLocationCell
            cell.landmarkLocation = landmarkLocation
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nextCellID, for: indexPath) as! NearLocationCell
        let item = indexPath.item - (overAllLocation?.landmarkLocation != nil ? 1 : 0)
        cell.location = overAllLocation?.locations[item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0, overAllLocation?.landmarkLocation != nil {
            return CGSize(width: 250, height: hCollectionView.frame.height)
        }
        return CGSize(width: 120, height: hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
    }
    
}
