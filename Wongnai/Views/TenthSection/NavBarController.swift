//
//  NavBarController.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 26/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit


protocol NavBarControllerProtocol: class {
    func didSelectMenu(item: Int)
}


class NavBarController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var menus: [String]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    let cellID = "cellID"
    
    weak var delegate: NavBarControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.register(NavBarCell.self, forCellWithReuseIdentifier: cellID)
        DispatchQueue.main.async {
            self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: [])
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NavBarCell
        cell.menu = menus?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = NavBarCell(frame: CGRect(x: 0, y: 0, width: 1000, height: self.collectionView.frame.height))
        dummyCell.menu = menus?[indexPath.item]
        dummyCell.layoutIfNeeded()
        let size = dummyCell.systemLayoutSizeFitting(CGSize(width: 1000, height: self.collectionView.frame.height))
        return CGSize(width: size.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectMenu(item: indexPath.item)
    }
    
}
