//
//  WelcomeViewController.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/04/09.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class WelcomeViewController: UIViewController {
    
    private let tivingLabel =  UILabel().then {
        $0.text = "TVING"
        $0.textAlignment = .center
        $0.backgroundColor = .tvingRed
        $0.font = .tvingSemiBold(ofSize: 60)
    }

    private let emailLabel = UILabel().then {
        $0.text = "반가워요!"
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 23)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .tvingRed
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.addTarget(self, action: #selector(presentToMainViewController), for: .touchUpInside)
//        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        dataBind()
    }
    var name: String?
    
    func dataBind() {
        emailLabel.text = name
        guard let name = self.name else { return }
        emailLabel.text = "\(name)님\n반가워요!"
    }
}

private extension WelcomeViewController {
    func style() {
        view.backgroundColor = .black
    }
    func setLayout() {
        view.addSubviews(tivingLabel, emailLabel, backButton)
        
        tivingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(210)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(tivingLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-100)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc
    func presentToMainViewController() {
            let nextViewController = MainViewController()
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true)
    }
    
    
//    func pushToMainViewController() {
//        let nextViewController = MainViewController()
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//    }
//
//    @objc
//    func backButtonTapped() {
//        pushToMainViewController()
////        let mainViewController = MainViewController()
////        self.navigationController?.pushViewController(mainViewController, animated: true)
//
////        if self.navigationController == nil {
////            self.dismiss(animated: true, completion: nil)
////        } else {
////            self.navigationController?.popViewController(animated: true)
////        }
//    }
}
