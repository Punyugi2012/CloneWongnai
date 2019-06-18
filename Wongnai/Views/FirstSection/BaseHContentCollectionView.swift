//
//  BaseHContentCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class BaseHContentCollectionView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.getFontSukhumvit(weight: .bold, size: 16)
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ดูทั้งหมด", for: .normal)
        button.titleLabel?.font = UIFont.getFontSukhumvit(weight: .medium, size: 14)
        button.setTitleColor(UIColor.rgb(37, 121, 195), for: .normal)
        return button
    }()
    

    lazy var hCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCells()
    }
    
    func setupView() {
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
    
    func setupCells() {}
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BaseHContentCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
}

