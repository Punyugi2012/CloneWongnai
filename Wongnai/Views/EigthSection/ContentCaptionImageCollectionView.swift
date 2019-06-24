//
//  BodyNewRestaurantCollectionView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 22/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class ContentCaptionImageCollectionView: BaseHContentCollectionView {
    
    let cellID = "cellID"
    
    var captionImages: [CaptionImage]? {
        didSet {
            self.hCollectionView.reloadData()
        }
    }
    
    var isShowHeaderControls = false
    
    init(isShowHeaderControls: Bool) {
        self.isShowHeaderControls = isShowHeaderControls
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView() {
        super.setupView()
        self.titleLabel.removeFromSuperview()
        self.moreButton.removeFromSuperview()
        self.hCollectionView.removeFromSuperview()
        self.addSubview(self.hCollectionView)
        if !isShowHeaderControls {
            self.hCollectionView.fillSuperview(padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
        }
        else {
            self.addSubview(self.titleLabel)
            self.titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
            self.addSubview(moreButton)
            self.moreButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
            self.moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
            self.hCollectionView.anchor(top: self.titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0), size: .zero)
        }
    }
    
    override func setupCells() {
        self.hCollectionView.register(CaptionImageCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    
}

extension ContentCaptionImageCollectionView {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return captionImages?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CaptionImageCell
        cell.captionImage = captionImages?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: self.hCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
}
