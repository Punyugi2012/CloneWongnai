//
//  HomeTextField.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 18/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class HomeTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.borderStyle = .roundedRect
        self.placeholder = "ร้านอาหาร, เสริมสวย, สปา, ย่าน, ..."
        self.font = UIFont.systemFont(ofSize: 14)
        
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowOffset = CGSize(width: 0, height: -2)
//        self.layer.shadowRadius = 6
        
        let tintColor = UIColor(white: 0.3, alpha: 1)
        let leftImageView = UIImageView(image: UIImage(named: "search")?.withRenderingMode(.alwaysTemplate))
        leftImageView.tintColor = tintColor
        leftImageView.contentMode = .center
        leftImageView.frame = CGRect(x: 0, y: 0, width: leftImageView.image!.size.width + 20, height: leftImageView.image!.size.height)
        
        let rightImageView =  UIImageView(image: UIImage(named: "map")?.withRenderingMode(.alwaysTemplate))
        rightImageView.tintColor = tintColor
        rightImageView.contentMode = .left
        rightImageView.frame = CGRect(x: 0, y: 0, width: rightImageView.image!.size.width + 10, height: rightImageView.image!.size.height)
        
        self.leftView = leftImageView
        self.rightView = rightImageView
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        self.attributedPlaceholder = NSAttributedString(string: "ร้านอาหาร, เสริมสวย, สปา, ย่าน, ...", attributes: [.foregroundColor: UIColor(white: 0.6, alpha: 1)])
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.8, alpha: 1)
        self.addSubview(view)
        view.anchor(top: self.topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: rightImageView.frame.width + 10), size: CGSize(width: 1, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
