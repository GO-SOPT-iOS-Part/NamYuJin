//
//  touchSecondViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/13.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

@objc
protocol TapButton: AnyObject {
    @objc optional func buttonTapped(count: Int)
}

class touchSecondViewController: UIViewController {

    private let countLabel = UILabel()
    private lazy var countButton = AnimationButton()
    private lazy var dismissButton = AnimationButton()
    
    weak var delegate: TapButton?
    private var tappedCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setStyle()
        setLayout()
    }
    func setStyle() {
        
        view.backgroundColor = .white
        
        countLabel.do {
            $0.textColor = .blue
            $0.text = "횟수는?!"
        }
        
        countButton.do {
            $0.setTitle("눌러줘", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.addTarget(self,
                         action: #selector(countButtonTapped),
                         for: .touchUpInside)
            $0.backgroundColor = .link
        }
        
        dismissButton.do {
            $0.setTitle("이전으로..", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.addTarget(self,
                         action: #selector(dismissButtonTapped),
                         for: .touchUpInside)
            $0.backgroundColor = .link
        }
    }
    func setLayout() {
        
        [countLabel, countButton, dismissButton]
            .forEach { view.addSubview($0) }
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        countButton.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints {
            $0.top.equalTo(countButton.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
    }
    @objc func countButtonTapped() {
        
        tappedCount += 1
    }
    
    @objc func dismissButtonTapped() {

        delegate?.buttonTapped?(count: tappedCount)
        self.dismiss(animated: true)
    }

}
