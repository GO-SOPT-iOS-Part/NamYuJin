//
//  SignUpViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/06.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import UIKit

final class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "dbwls7ska@gmail.com",
                                    nickname: "yujin",
                                    password: "dbwls159!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
