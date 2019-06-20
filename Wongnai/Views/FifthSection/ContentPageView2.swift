//
//  ContentPageView2.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 20/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var recommend: Recommend? {
        didSet {
            imageView.image = UIImage(named: recommend?.imageName ?? "")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 2
        self.clipsToBounds = true
        
        self.addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ImageCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var recommends: [Recommend]? {
        didSet {
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommends?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ImageCollectionCell
        cell.recommend = recommends?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 30) / 2, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}



class CustomPageViewController2: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var imageCollectionControllers: [ImageCollectionController] = []
    
    var recommends: [Recommend]? {
        didSet {
            guard let recommends = recommends else {return}
            var collected: [Recommend] = []
            for (index, recommend) in recommends.enumerated() {
                collected.append(recommend)
                if (index + 1) % 4 == 0 {
                    let imageCollectionController = ImageCollectionController(collectionViewLayout: UICollectionViewFlowLayout())
                    imageCollectionController.recommends = collected
                    imageCollectionControllers.append(imageCollectionController)
                    collected = []
                }
            }
            if !collected.isEmpty {
                let imageCollectionController = ImageCollectionController(collectionViewLayout: UICollectionViewFlowLayout())
                imageCollectionController.recommends = collected
                imageCollectionControllers.append(imageCollectionController)
            }
            if let firstVC = imageCollectionControllers.first {
                setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            }
        }
    }
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = imageCollectionControllers.firstIndex(where: { (ic) -> Bool in
            return ic === viewController
        })
        if let index = index, imageCollectionControllers.count > 1 {
            if index - 1 < 0 {
                return imageCollectionControllers.last!
            }
            else {
                return imageCollectionControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = imageCollectionControllers.firstIndex(where: { (ic) -> Bool in
            return ic === viewController
        })
        if let index = index, imageCollectionControllers.count > 1 {
            if index + 1 > imageCollectionControllers.count - 1 {
                return imageCollectionControllers.first!
            }
            else {
                return imageCollectionControllers[index + 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let firstVC = pendingViewControllers.first else {return}
        let index = imageCollectionControllers.firstIndex { (ic) -> Bool in
            return ic === firstVC
        }
        currentIndex = index ?? 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return imageCollectionControllers.count == 1 ? 0 : imageCollectionControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    

}


class ContentPageView2: UIView {
    
    
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
    
    let customPageViewController = CustomPageViewController2(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var recommends: [Recommend]? {
        didSet {
            customPageViewController.recommends = recommends
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        titleLabel.text = "ชวนพิสูจน์ มื้อพิเศษ"
        self.addSubview(self.titleLabel)
        self.titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        
        self.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        
        self.addSubview(customPageViewController.view)
        customPageViewController.view.anchor(top: titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
