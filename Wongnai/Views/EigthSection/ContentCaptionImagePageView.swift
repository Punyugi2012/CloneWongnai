//
//  ContentCaptionImagePageView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 22/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += 10
        contentSize.width += 15
        return contentSize
    }
    
}

class CaptionImageController: UIViewController {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "place1"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "The Barn"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    let locationNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "เมืองระยอง"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = UIColor(white: 0, alpha: 0.5)
        label.textAlignment = .center
        return label
    }()
    
    let nBookmarkLabel: UILabel = {
        let label = UILabel()
        label.text = "301"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    let captionLabel: UILabel = {
        
        let label = UILabel()
        
        let attributedString = NSMutableAttributedString(string: "[รีวิว] California Steak ระยอง สเต็กไม่อั้นบนดาดฟ้าโรงแรมเพียง 690 บ.", attributes: [.font: UIFont.systemFont(ofSize: 15)])
        attributedString.append(NSAttributedString(string: "• [Ad]", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        label.attributedText = attributedString
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let bookmarkImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "mark")?.withRenderingMode(.alwaysTemplate))
        iv.tintColor = .gray
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        imageView.anchor(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: nil, trailing: self.view.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 250))
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        
        containerView.addSubview(bookmarkImageView)
        bookmarkImageView.anchor(top: containerView.topAnchor, leading: nil, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 20), size: CGSize(width: 30, height: 30))
        
        containerView.addSubview(captionLabel)
        captionLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 70, bottom: 0, right: 70), size: .zero)
        
        containerView.addSubview(nBookmarkLabel)
        nBookmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        nBookmarkLabel.centerXAnchor.constraint(equalTo: bookmarkImageView.centerXAnchor).isActive = true
        nBookmarkLabel.topAnchor.constraint(equalTo: bookmarkImageView.bottomAnchor, constant: 5).isActive = true
        
        self.view.addSubview(containerView)
        containerView.anchor(top: imageView.bottomAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
        
        self.view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 0, y: 250-25-20, width: self.view.frame.width, height: 20)
        
        self.view.addSubview(locationNameLabel)
        locationNameLabel.anchor(top: self.view.topAnchor, leading: nil, bottom: nil, trailing: self.view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), size: .zero)
    }
    
}

class CaptionImagePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    let captionImageControllers: [CaptionImageController] = [
        CaptionImageController(),
        CaptionImageController(),
    ]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        setViewControllers([captionImageControllers.first!], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = captionImageControllers.firstIndex(where: { (ic) -> Bool in
            return ic === viewController
        })
        if let index = index, captionImageControllers.count > 1 {
            if index - 1 < 0 {
                return captionImageControllers.last!
            }
            else {
                return captionImageControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = captionImageControllers.firstIndex(where: { (ic) -> Bool in
            return ic === viewController
        })
        if let index = index, captionImageControllers.count > 1 {
            if index + 1 > captionImageControllers.count - 1 {
                return captionImageControllers.first!
            }
            else {
                return captionImageControllers[index + 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let firstVC = pendingViewControllers.first else {return}
        let index = captionImageControllers.firstIndex { (ic) -> Bool in
            return ic === firstVC
        }
        currentIndex = index ?? 0
        print(currentIndex)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return captionImageControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.subviews.forEach { (view) in
            if !(view is UIPageControl) {
                view.frame = self.view.bounds
            }
            else if view is UIPageControl {
                view.frame.origin.y = 250 - 37
            }
        }
    }
    
    
}

class ContentCaptionImagePageView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ร้านอาหารใหม่ และน่าสนใจ ในชลบุรี"
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
    
    let pageView = CaptionImagePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0), size: CGSize(width: 0, height: 50))
        
        self.addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        
        
        self.addSubview(pageView.view)
        pageView.view.anchor(top: titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
