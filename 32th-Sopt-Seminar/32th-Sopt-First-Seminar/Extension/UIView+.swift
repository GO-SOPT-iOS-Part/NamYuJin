//
//  UIView+.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/08.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
