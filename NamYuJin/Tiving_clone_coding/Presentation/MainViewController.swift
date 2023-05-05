//
//  MainViewController.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/04/30.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {

    private lazy var mypagebutton = UIButton().then {
        $0.setImage(UIImage(named: "dusansymbol"), for: .normal)
        $0.addTarget(self, action: #selector(presentToMyPageViewController), for: .touchUpInside)
//        $0.addTarget(self, action: #selector(mypageButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension MainViewController {
    func style() {
        view.backgroundColor = .black
    }
    
    func setLayout() {
        view.addSubviews(mypagebutton)
        
        mypagebutton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.trailing.equalToSuperview().offset(-50)
        }
    }
    
    @objc
    func presentToMyPageViewController() {
            let nextViewController = MyPageViewController()
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true)
    }
    
//    func pushToMyPageViewController() {
//        let nextViewController = MyPageViewController()
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//    }
//
//    @objc
//    func mypageButtonTapped() {
//        pushToMyPageViewController()
//    }
    
}
