//
//  UIColor+.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/04/12.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    class var tvingRed: UIColor {
        return UIColor(r: 234, g: 51, b: 58)
    }
}
