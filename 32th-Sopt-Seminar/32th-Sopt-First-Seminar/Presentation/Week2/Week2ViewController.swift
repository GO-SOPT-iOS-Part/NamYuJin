//
//  Week2ViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/08.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class Week2ViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "조금만 더 눌러바"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음으로!", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(presentToSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()

    }
    
}
private extension Week2ViewController {
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(nameLabel, nextButton)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(250)
            $0.centerX.equalToSuperview()
            
        }
        nextButton.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            
        }
        
        
    }
    
    
    @objc
    func presentToSecondViewController() {
            let secondViewController = SecondViewController()
    //        if let name = nameTextField.text {
    //            secondViewController.dataBind(name: name)
    //        }
            secondViewController.modalPresentationStyle = .fullScreen
            self.present(secondViewController, animated: true)
    }
}
