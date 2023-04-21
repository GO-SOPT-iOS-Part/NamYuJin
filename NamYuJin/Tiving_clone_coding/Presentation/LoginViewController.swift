//
//  LoginViewController.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/04/09.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    private let nameLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = .systemFont(ofSize: 23)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let IDTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.clearButtonMode = .whileEditing
        $0.backgroundColor = .darkGray
        $0.setLeftPaddingPoints(10)
        $0.autocapitalizationType = .none
        $0.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [.foregroundColor: UIColor.white])
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        $0.addTarget(self, action: #selector(textFieldDidBeginEditing),for: .editingDidBegin)
        $0.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
    }
    
    private let PWTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.clearButtonMode = .whileEditing
        $0.backgroundColor = .darkGray
        $0.setLeftPaddingPoints(10)
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [.foregroundColor: UIColor.white])
        $0.isSecureTextEntry = true
        $0.clearButtonMode = .never
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        $0.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        $0.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
    }
       
    private lazy var removePWButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.addTarget(self, action: #selector(removePWButtonTapped), for: .touchUpInside)
        $0.isHidden = true
    }
       
    private lazy var securityButton = UIButton().then {
        $0.setImage(UIImage(named: "eye-slash"), for: .normal)
        $0.addTarget(self, action: #selector(securityButtonTapped), for: .touchUpInside)
        $0.isHidden = true
    }

    
    private lazy var presentButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        
        $0.setBackgroundColor(.clear, for: .disabled)
        $0.setBackgroundColor(.tvingRed, for: .normal)
        
        $0.setTitleColor(.gray, for: .disabled)
        $0.setTitleColor(.white, for: .normal)
        
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.layer.cornerRadius = 5
        $0.isEnabled = false
        
        $0.addTarget(self, action: #selector(presentButtonTapped),for: .touchUpInside)
    }
    
    private lazy var searchIDButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.lightGray, for: .normal)
    }
    
    private lazy var searchPWButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.lightGray, for: .normal)
    }
    
    private let accountLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    private lazy var makeAccountButton = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setUnderline()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
}

private extension LoginViewController {
    func style() {
        view.backgroundColor = .black
    }
    func setLayout() {
        
        view.addSubviews(nameLabel, IDTextField, PWTextField, removePWButton, securityButton, presentButton, searchIDButton, searchPWButton, accountLabel, makeAccountButton)
        
        PWTextField.addSubviews(removePWButton, securityButton)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        IDTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(31)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        PWTextField.snp.makeConstraints {
            $0.top.equalTo(IDTextField.snp.bottom).offset(7)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        securityButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(40)
            $0.trailing.equalToSuperview()
        }

        removePWButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().inset(40)
        }
        
        presentButton.snp.makeConstraints {
            $0.top.equalTo(PWTextField.snp.bottom).offset(21)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        searchIDButton.snp.makeConstraints {
            $0.top.equalTo(presentButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(85)
        }
        
        searchPWButton.snp.makeConstraints {
            $0.top.equalTo(presentButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().offset(-85)
        }
        
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(searchIDButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(51)
        }
        
        makeAccountButton.snp.makeConstraints {
            $0.top.equalTo(searchIDButton.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(65)
            $0.height.equalTo(22)
        }
    }

    
    @objc
    private func removePWButtonTapped() {
        PWTextField.text = ""
    }
    
    @objc
    private func securityButtonTapped() {
        PWTextField.isSecureTextEntry.toggle()
    }
    
    func presentButtonIsEnabled() {
        if presentButton.isEnabled == true {
            presentButton.layer.backgroundColor = UIColor.red.cgColor
            presentButton.setTitleColor(.white, for: .normal)
            presentButton.layer.borderWidth = 0
        } else {
            presentButton.setTitleColor(.gray, for: .normal)
            presentButton.backgroundColor = .black
            presentButton.layer.borderWidth = 1
        }
    }
    
    func presentToSecondViewController() {
            let secondViewController = WelcomeViewController()
            guard let name = IDTextField.text else { return }
            secondViewController.name = name
            secondViewController.modalPresentationStyle = .fullScreen
            self.present(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    func textFieldDidChange(sender: UITextField) {
        self.presentButton.isEnabled = !(self.IDTextField.isEmpty || self.PWTextField.isEmpty)
    }
    
    @objc
    func textFieldDidBeginEditing(sender: UITextField) {
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.lightGray.cgColor
        if sender == PWTextField {
            removePWButton.isHidden = false
            securityButton.isHidden = false
        }
    }

    @objc
    func textFieldDidEndEditing(sender: UITextField) {
        sender.layer.borderWidth = 0
        sender.layer.borderColor = UIColor.lightGray.cgColor
    }

}
