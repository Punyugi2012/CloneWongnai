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
    let secondSectionID = "secondSectionID"
    let thirdSectionID = "thirdSectionID"
    let fourthSectionID = "fourthSectionID"
    let fifthSectionID = "fifthSectionID"
    let sixthSectionID = "sixthSectionID"
    let seventhSectionID = "seventhSectionID"
    let eigthSectionID = "eigthSectionID"
    let ninethSectionID = "ninethSectionID"
    let tenthSectionID = "tenthSectionID"
    let eleventhSectionID = "eleventhSectionID"
    
    lazy var topInset: CGFloat = {
        return UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height
    }()
    
    let homeTextField: HomeTextField = {
        let tv = HomeTextField()
        tv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tv.borderStyle = .none
        tv.layer.cornerRadius = 5
        tv.clipsToBounds = true
        return tv
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(37, 121, 195)
        return view
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
        self.collectionView.register(SecondSectionCell.self, forCellWithReuseIdentifier: secondSectionID)
        self.collectionView.register(ThirdSectionCell.self, forCellWithReuseIdentifier: thirdSectionID)
        self.collectionView.register(FourthSectionCell.self, forCellWithReuseIdentifier: fourthSectionID)
        self.collectionView.register(FifthSectionCell.self, forCellWithReuseIdentifier: fifthSectionID)
        self.collectionView.register(SixthSectionCell.self, forCellWithReuseIdentifier: sixthSectionID)
        self.collectionView.register(SeventhSectionCell.self, forCellWithReuseIdentifier: seventhSectionID)
        self.collectionView.register(EigthSectionCell.self, forCellWithReuseIdentifier: eigthSectionID)
        self.collectionView.register(NinethSectionCell.self, forCellWithReuseIdentifier: ninethSectionID)
        self.collectionView.register(TenthSectionCell.self, forCellWithReuseIdentifier: tenthSectionID)
        self.collectionView.register(EleventhSectionCell.self, forCellWithReuseIdentifier: eleventhSectionID)
    }
    
    func setupNavigation() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        statusBarView.backgroundColor = .clear
        self.view.addSubview(statusBarView)
        statusBarView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: UIApplication.shared.statusBarFrame.height)
        
        let navBar = navigationController!.navigationBar
        navBar.addSubview(homeTextField)
        homeTextField.anchor(top: navBar.topAnchor, leading: navBar.leadingAnchor, bottom: navBar.bottomAnchor, trailing: navBar.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 7, right: 70))
        
        navBar.addSubview(separatorView)
        separatorView.anchor(top: nil, leading: navBar.leadingAnchor, bottom: navBar.bottomAnchor, trailing: navBar.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 1))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "clock")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: nil)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
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
        else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondSectionID, for: indexPath) as! SecondSectionCell
            return cell
        }
        else if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdSectionID, for: indexPath) as! ThirdSectionCell
            return cell
        }
        else if indexPath.item == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fourthSectionID, for: indexPath) as! FourthSectionCell
            return cell
        }
        else if indexPath.item == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fifthSectionID, for: indexPath) as! FifthSectionCell
            var firstSubViewHeight: CGFloat = 277
            if Double(recommends.count) / 4.0 <= 1  {
                firstSubViewHeight -= 17
            }
            var secondSubViewHeight: CGFloat = 277
            if Double(specialMeals.count) / 4.0 <= 1  {
                secondSubViewHeight -= 17
            }
            cell.firstPageViewHeight = firstSubViewHeight
            cell.secondPageViewHeight = secondSubViewHeight
            cell.specialMeals = specialMeals
            cell.recommends = recommends
            return cell
        }
        else if indexPath.item == 6 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sixthSectionID, for: indexPath) as! SixthSectionCell
            return cell
        }
        else if indexPath.item == 7 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seventhSectionID, for: indexPath) as! SeventhSectionCell
            return cell
        }
        else if indexPath.item == 8 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eigthSectionID, for: indexPath) as! EigthSectionCell
            return cell
        }
        else if indexPath.item == 9 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ninethSectionID, for: indexPath) as! NinethSectionCell
            return cell
        }
        else if indexPath.item == 10 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tenthSectionID, for: indexPath) as! TenthSectionCell
            return cell
        }
        else if indexPath.item == 11 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eleventhSectionID, for: indexPath) as! EleventhSectionCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    let recommends: [Recommend] = [
        Recommend(imageName: "rc1"),
        Recommend(imageName: "rc2"),
        Recommend(imageName: "rc3"),
        Recommend(imageName: "rc4"),
        Recommend(imageName: "rc5"),
        Recommend(imageName: "rc6"),
    ]
    
    let specialMeals: [SpecialMeal] = [
        SpecialMeal(imageName: "sc1"),
        SpecialMeal(imageName: "sc2"),
        SpecialMeal(imageName: "sc3"),
        SpecialMeal(imageName: "sc4"),
    ]
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: self.view.frame.width, height: 350)
        }
        else if indexPath.item == 1 {
            return CGSize(width: self.view.frame.width, height: 920)
        }
        else if indexPath.item == 2 {
            return CGSize(width: self.view.frame.width, height: 370)
        }
        else if indexPath.item == 3 {
            return CGSize(width: self.view.frame.width, height: 290)
        }
        else if indexPath.item == 4 {
            return CGSize(width: self.view.frame.width, height: 140)
        }
        else if indexPath.item == 5 {
            var firstSubViewHeight: CGFloat = 277
            if Double(recommends.count) / 4.0 <= 1  {
                firstSubViewHeight -= 17
            }
            var secondSubViewHeight: CGFloat = 277
            if Double(specialMeals.count) / 4.0 <= 1  {
                secondSubViewHeight -= 17
            }
            return CGSize(width: self.view.frame.width, height: firstSubViewHeight + secondSubViewHeight)
        }
        else if indexPath.item == 6 {
            return CGSize(width: self.view.frame.width, height: 180)
        }
        else if indexPath.item == 7 {
            return CGSize(width: self.view.frame.width, height: 300)
        }
        else if indexPath.item == 8 {
            return CGSize(width: self.view.frame.width, height: 1830)
        }
        else if indexPath.item == 9 {
            return CGSize(width: self.view.frame.width, height: 1290)
        }
        else if indexPath.item == 10 {
            return CGSize(width: self.view.frame.width, height: 700)
        }
        else if indexPath.item == 11 {
            return CGSize(width: self.view.frame.width, height: 370)
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
        
        homeTextField.alpha = offset
        
        separatorView.alpha = offset
        
        
        statusBarView.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.backgroundColor = backgroundColor

        let rightBarButton = navigationItem.rightBarButtonItem
        if offset < 0.2 {
            rightBarButton?.tintColor = .white
            self.navigationController?.navigationBar.barStyle = .black
        }
        else {
            rightBarButton?.tintColor = UIColor.rgb(37, 121, 195)
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
