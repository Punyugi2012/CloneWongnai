//
//  SecondSectionCell.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 19/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

struct HeaderPrivilege {
    
    let imageName: String
    
}

struct BodyPrivilege {
    
    let title: String
    let subTitle: String
    let imageName: String
}

class SecondSectionCell: UICollectionViewCell {
    
    let headerPrivilegeCollectionView = HeaderPrivilegeCollection()
    
    let bodyPrivilegeCollectionView = BodyPrivilegeCollectionView()
    
    let headerPrivileges: [HeaderPrivilege] = [
        HeaderPrivilege(imageName: "scb")
    ]
    
    let bodyPrivileges: [BodyPrivilege] = [
        BodyPrivilege(title: "อร่อยนี้มีส่วนลด", subTitle: "GSB Credit Card", imageName: "bp1"),
        BodyPrivilege(title: "อิ่มคุ้ม ฟินทุกมื้อ", subTitle: "UnionPay Card", imageName: "bp2"),
        BodyPrivilege(title: "รับเงินคืนสูงสุด", subTitle: "10,000 บาท", imageName: "bp3")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(headerPrivilegeCollectionView)
        headerPrivilegeCollectionView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 170))
        headerPrivilegeCollectionView.headerPrivileges = headerPrivileges
        
        self.addSubview(bodyPrivilegeCollectionView)
        bodyPrivilegeCollectionView.anchor(top: headerPrivilegeCollectionView.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .zero, size: CGSize(width: 0, height: 200))
        bodyPrivilegeCollectionView.bodyPrivileges = bodyPrivileges
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
