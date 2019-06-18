//
//  GradientBarView.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 18/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

class GradientBarView: UIView {
    
    var gradientLayer: CAGradientLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [UIColor.rgb(171, 61, 26).cgColor, UIColor.rgb(216, 144, 54).cgColor]
        gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 1, y: 0)
        self.layer.addSublayer(gradientLayer!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        gradientLayer?.frame = self.bounds
    }
    
}
