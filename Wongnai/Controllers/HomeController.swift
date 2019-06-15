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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .blue
        if indexPath.item == 0 {
            cell.backgroundColor = .red
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: self.view.frame.width, height: 250)
        }
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        
        let offset = scrollView.contentOffset.y / 50
        
        print(offset)

        let backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: min(1, offset))
        
//        self.navigationController?.navigationBar.tintColor = UIColor(hue: 1, saturation: offset, brightness: 1, alpha: 1)
        
        statusBarView.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.backgroundColor = backgroundColor


        if offset < 0.2 {
            self.navigationController?.navigationBar.barStyle = .black
        }
        else {
            self.navigationController?.navigationBar.barStyle = .default
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
