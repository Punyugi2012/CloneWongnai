//
//  CollectionViewContainerView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class CollectionViewContainerView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NavBarControllerProtocol {
    
    var collectionViews: [UICollectionView] = []
    
    let cellID = "cellID"
    
    let lastCellID = "lastCellID"
    
    var item: Int?
    
    var menus: [String]?
    
    var lifeStyleCaptionImages: [[LifeStyleCaptionImage]]? {
        didSet {
            lifeStyleCaptionImages?.forEach { (_) in
                let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.backgroundColor = .white
                collectionView.showsHorizontalScrollIndicator = false
                if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                }
                collectionView.register(ContentCell.self, forCellWithReuseIdentifier: cellID)
                self.collectionViews.append(collectionView)
                collectionView.register(LastContentCell.self, forCellWithReuseIdentifier: lastCellID)
            }
            if let firstCV = collectionViews.first {
                self.addSubview(firstCV)
                firstCV.fillSuperview(padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
                item = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didSelectMenu(item: Int) {
        guard let currentItem = self.item else {return}
        collectionViews[currentItem].removeFromSuperview()
        self.addSubview(collectionViews[item])
        collectionViews[item].fillSuperview(padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
        self.item = item
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let item = item {
            if let datas = lifeStyleCaptionImages?[item] {
                return datas.count > 11 ? 12 : datas.count
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 11 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lastCellID, for: indexPath) as! LastContentCell
            if let item = item {
                cell.menu = menus?[item]
                cell.lifeStyleCaptionImage = lifeStyleCaptionImages?[item][indexPath.item]
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ContentCell
        if let item = item {
            cell.lifeStyleCaptionImage = lifeStyleCaptionImages?[item][indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let item = item {
            return CGSize(width: 130, height: collectionViews[item].frame.height)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}

class NavBarCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.getFontSukhumvit(weight: .bold, size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    var menu: String? {
        didSet {
            label.text = menu
        }
    }
    
    override var isSelected: Bool {
        didSet {
            label.textColor = isSelected ? .black : .lightGray
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            label.textColor = isHighlighted ? .black : .lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        label.fillSuperview()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

