//
//  UITextField+.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/04/12.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit
import Then

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    var isEmpty: Bool {
        if text?.isEmpty ?? true {
            return true
        }
        return false
    }
}
