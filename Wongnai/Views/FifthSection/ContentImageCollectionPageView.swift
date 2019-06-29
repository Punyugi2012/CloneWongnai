//
//  ContentPageView2.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 20/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class ImageCollectionCell<Model: ContentImageCollectionPageViewProtocol>: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var model: Model? {
        didSet {
            imageView.image = UIImage(named: model?.imageName ?? "")
//            if let recommend = model as? Recommend {
//                imageView.image = UIImage(named: recommend.imageName)
//            }
//            else if let special = model as? SpecialMeal {
//                imageView.image = UIImage(named: special.imageName)
//            }
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

class ImageCollectionController<Model: ContentImageCollectionPageViewProtocol>: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var models: [Model]? {
        didSet {
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.register(ImageCollectionCell<Model>.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ImageCollectionCell<Model>
        cell.model = models?[indexPath.item]
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



class ImageCollectionPageViewController<Model: ContentImageCollectionPageViewProtocol>: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var imageCollectionControllers: [ImageCollectionController<Model>] = []
    
    var models: [Model]? {
        didSet {
            guard let models = models else {return}
            imageCollectionControllers = []
            var collected: [Model] = []
            for (index, model) in models.enumerated() {
                collected.append(model)
                if (index + 1) % 4 == 0 {
                    let imageCollectionController = ImageCollectionController<Model>(collectionViewLayout: UICollectionViewFlowLayout())
                    imageCollectionController.models = collected
                    imageCollectionControllers.append(imageCollectionController)
                    collected = []
                }
            }
            if !collected.isEmpty {
                let imageCollectionController = ImageCollectionController<Model>(collectionViewLayout: UICollectionViewFlowLayout())
                imageCollectionController.models = collected
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


class ContentImageCollectionPageView<Model: ContentImageCollectionPageViewProtocol>: UIView {
    
    
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
    
    let imageCollectionPageView = ImageCollectionPageViewController<Model>(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var models: [Model]? {
        didSet {
            imageCollectionPageView.models = models
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        titleLabel.text = ""
        self.addSubview(self.titleLabel)
        self.titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        
        self.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        
        self.addSubview(imageCollectionPageView.view)
        imageCollectionPageView.view.anchor(top: titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero, size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
