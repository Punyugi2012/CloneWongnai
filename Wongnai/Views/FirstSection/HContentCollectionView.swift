//
//  HContentCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class HContentCollectionView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ร้านใกล้ตัว"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ดูทั้งหมด", for: .normal)
        return button
    }()
    
    var overAllLocation: OverAllLocation? {
        didSet {
            hCollectionView.reloadData()
        }
    }
    
    lazy var hCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(LandmarkLocationCell.self, forCellWithReuseIdentifier: firstCellID)
        collectionView.register(LocationCell.self, forCellWithReuseIdentifier: nextCellID)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        return collectionView
    }()
    
    let firstCellID = "firstCellID"
    let nextCellID = "cellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        
        self.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        
        self.addSubview(hCollectionView)
        hCollectionView.anchor(top: titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0))
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HContentCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let overAllLocation = self.overAllLocation, overAllLocation.landmarkLocation != nil {
            return overAllLocation.locations.count + 1
        }
        return overAllLocation?.locations.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0, let landmarkLocation = overAllLocation?.landmarkLocation  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellID, for: indexPath) as! LandmarkLocationCell
            cell.landmarkLocation = landmarkLocation
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nextCellID, for: indexPath) as! LocationCell
        cell.location = overAllLocation?.locations[indexPath.item - 1]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: 250, height: hCollectionView.frame.height)
        }
        return CGSize(width: 120, height: hCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
    }
}
