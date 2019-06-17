//
//  HomeController.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 15/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let statusBarView = UIView()
    
    let cellID = "cellID"
    let headerID = "headerID"
    let firstSectionID = "firstSectionID"
    
    lazy var topInset: CGFloat = {
        return UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigation()
    }
    
    func setupCollectionView() {
        
        self.collectionView.contentInset.top = -topInset
        self.collectionView.scrollIndicatorInsets.top = -topInset
        self.collectionView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: headerID)
        self.collectionView.register(FirstSectionCell.self, forCellWithReuseIdentifier: firstSectionID)
        
    }
    
    func setupNavigation() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        statusBarView.backgroundColor = .clear
        self.view.addSubview(statusBarView)
        statusBarView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: UIApplication.shared.statusBarFrame.height)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerID, for: indexPath) as! HomeHeaderCell
            headerImageView = cell.imageView
            blackView = cell.blackView
            nearMeButton = cell.nearMeButton
            return cell
        }
        else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstSectionID, for: indexPath) as! FirstSectionCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: self.view.frame.width, height: 350)
        }
        else if indexPath.item == 1 {
            return CGSize(width: self.view.frame.width, height: 500)
        }
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    var headerImageView: UIImageView?
    var blackView: UIView?
    var nearMeButton: UIButton?
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y / 50
    
        let backgroundColor = UIColor.white.withAlphaComponent(min(1, offset))
        
        nearMeButton?.alpha = 1 - offset
        
//        self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
        
        statusBarView.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.backgroundColor = backgroundColor


        if offset < 0.2 {
            self.navigationController?.navigationBar.barStyle = .black
        }
        else {
            self.navigationController?.navigationBar.barStyle = .default
        }
        
        let changedY = -scrollView.contentOffset.y
        if changedY < 0 {
            headerImageView?.frame.origin.y = min(50, -(changedY / 2))
        }
        else {
            let width = max(view.frame.width, view.frame.width + changedY * 2)
            let height = 230 + changedY
            headerImageView?.frame = CGRect(x: min(0, -changedY), y: min(0, -changedY), width: width, height: height)
        }
        blackView?.frame = headerImageView?.frame ?? .zero
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
