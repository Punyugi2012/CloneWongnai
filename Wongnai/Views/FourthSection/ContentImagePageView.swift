//
//  BasePageView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 20/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        imageView.fillSuperview()
    }
    
}

class ImagePageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var imageViewControllers: [ImageViewController] = []
    
    var imageNames: [String]? {
        didSet {
            guard let imageNames = imageNames else {return}
            imageViewControllers = imageNames.map({ (name) -> ImageViewController in
                let vc = ImageViewController()
                vc.imageView.image = UIImage(named: name)
                return vc
            })
            self.setViewControllers([imageViewControllers.first!], direction: .forward, animated: true, completion: nil)
            time = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { (timer) in
                if self.currentIndex + 1 > self.imageViewControllers.count - 1 {
                    self.currentIndex = 0
                    self.setViewControllers([self.imageViewControllers[self.currentIndex]], direction: .reverse, animated: true)
                }
                else {
                    self.currentIndex += 1
                    self.setViewControllers([self.imageViewControllers[self.currentIndex]], direction: .forward, animated: true)
                }
            })
        }
    }
    
    var time: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        time?.invalidate()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = imageViewControllers.firstIndex(where: { (ic) -> Bool in
            return ic === viewController
        })
        if let index = index, imageViewControllers.count > 1 {
            if index - 1 < 0 {
                return imageViewControllers.last!
            }
            else {
                return imageViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = imageViewControllers.firstIndex(where: { (ic) -> Bool in
            return ic === viewController
        })
        if let index = index, imageViewControllers.count > 1 {
            if index + 1 > imageViewControllers.count - 1 {
                return imageViewControllers.first!
            }
            else {
                return imageViewControllers[index + 1]
            }
        }
        return nil
    }
    
    var currentIndex = 0
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let index = imageViewControllers.firstIndex { (ic) -> Bool in
            return ic === pendingViewControllers.first!
        }
        currentIndex = index ?? 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return imageViewControllers.count
    }

    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    

    
    
}

class ContentImagePageView: UIView {
    
    let imagePageViewController = ImagePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var imageNames: [String]? {
        didSet {
            imagePageViewController.imageNames = imageNames
        }
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imagePageViewController.view)
        imagePageViewController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
