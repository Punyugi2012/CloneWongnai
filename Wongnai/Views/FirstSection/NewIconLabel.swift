//
//  NewIconLabel.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 18/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class NewIconLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.text = "NEW"
        self.textColor = .white
        self.font = UIFont.boldSystemFont(ofSize: 17)
        self.backgroundColor = UIColor.rgb(230, 83, 68)
        self.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
