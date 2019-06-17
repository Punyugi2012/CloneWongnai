//
//  Extensions+Int.swift
//  Wongnai
//
//  Created by punyawee jaroentao on 17/6/2562 BE.
//  Copyright © 2562 punyawee jaroentao. All rights reserved.
//

import Foundation


extension Int {
    func getFormateMeterDistance() -> String {
        let devided = self / 1000
        if devided == 0 {
            return "\(self) ม."
        }
        return "\(devided) กม."
    }
}
