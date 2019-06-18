//
//  Extensions+UIFont.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 18/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import UIKit

enum SukhumViewWeight {
    case thin, medium, bold
}

extension UIFont {
    static func getFontSukhumvit(weight: SukhumViewWeight, size: CGFloat) -> UIFont {
        var name = ""
        if weight == .thin {
            name = "SukhumvitSet-Thin"
        }
        else if weight == .medium {
            name = "SukhumvitSet-Medium"
        }
        else if weight == .bold {
            name = "SukhumvitSet-Bold"
        }
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
