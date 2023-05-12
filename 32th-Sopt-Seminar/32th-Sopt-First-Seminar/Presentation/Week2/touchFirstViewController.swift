//
//  touchFirstViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/13.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

final class touchFirstViewController: UIViewController {
    private var count = 0 {
        didSet {
            self.countLabel.text = count > 10 ? "10번 이상 눌렀네.. \(count)" : "조금만 더 눌러바.. \(count)"
        }
    }
    
    private let countLabel = UILabel().then {
        $0.backgroundColor = .black
        $0.text = "버튼 탭 횟수는 ?!"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var nextButton = AnimationButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    private func setStyle() {
        
        view.backgroundColor = .white
        
        nextButton.do {
            $0.setTitle("다음으로!", for: .normal)
            $0.backgroundColor = .red
            $0.addTarget(self,
                         action: #selector(nextButtonTapped),
                         for: .touchUpInside)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        }
    }
    private func setLayout() {
        
        view.addSubview(countLabel)
        view.addSubview(nextButton)
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(10)
            $0.size.equalTo(100)
            $0.centerX.equalToSuperview()
        }
    }
    @objc
    func nextButtonTapped() {
        
        let viewController = touchSecondViewController()
        
        viewController.delegate = self
        
        self.present(viewController, animated: true)
    }
}

extension touchFirstViewController: TapButton {
    
    func buttonTapped(count: Int) {
        self.count = count
    }
}
