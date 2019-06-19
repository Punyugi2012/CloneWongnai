//
//  HeaderPrivilegeCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class HeaderPrivilegeCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    var headerPrivilege: HeaderPrivilege? {
        didSet {
            imageView.image = UIImage(named: headerPrivilege?.imageName ?? "")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
