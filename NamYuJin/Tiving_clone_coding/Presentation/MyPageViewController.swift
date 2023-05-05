//
//  MyPageViewController.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/04/30.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class MyPageViewController: BaseViewController {
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_before"), for: .normal)
    }

    private lazy var bellButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bell")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private lazy var generalButton = UIButton().then {
        $0.setImage(UIImage(systemName: "gearshape")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "dusansymbol")
        $0.layer.cornerRadius = 15
    }
    
    private let profileLabel = UILabel().then {
        $0.text = "Doosan"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    private lazy var shiftButton = UIButton().then {
        $0.setTitle(" 프로필 전환 ", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 13)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 3
    }
    
    private let membershipView = UIView().then {
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 3
    }
    
    private let myTicketLabel = UILabel().then {
        let leadingImage = NSTextAttachment(image: .membership)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: "  나의 이용권"))
        $0.attributedText = attributedString
        $0.textColor = .lightGray
        $0.font = UIFont(name: "Pretendard-Medium", size: 13)
    }
    
    private let myCashLabel = UILabel().then {
        let leadingImage = NSTextAttachment(image: .cash)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: "  티빙캐시"))
        $0.attributedText = attributedString
        $0.textColor = .lightGray
        $0.font = UIFont(name: "Pretendard-Medium", size: 13)
    }
    
    private let ticketLabel = UILabel().then {
        $0.text = "사용중인 이용권이 없습니다."
        $0.textColor = .lightGray
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    private let cashLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }
    
    private let advertisementView = UIView().then {
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 3
    }
    
    private let advertisementLabel = UILabel().then {
        let leadingImage = NSTextAttachment(image: .tvn)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "이용권을 구매하고 "))
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: " 등 인기 프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!"))
        $0.numberOfLines = 2
        $0.attributedText = attributedString
        $0.textColor = .lightGray
        $0.font = UIFont(name: "Pretendard-Medium", size: 13)
    }
    
    private let tableView = UITableView()
    private let dummy = MyPage.dummy()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
            $0.rowHeight = 60
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    override func setLayout() {
        view.addSubviews(backButton, bellButton, generalButton, profileImage, profileLabel, shiftButton, membershipView, advertisementView, tableView)
        
        membershipView.addSubviews(myTicketLabel, myCashLabel, ticketLabel, cashLabel)
        
        advertisementView.addSubviews(advertisementLabel)
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(24)
        }
        
        bellButton.snp.makeConstraints {
            $0.top.equalTo(backButton)
            $0.trailing.equalToSuperview().offset(-70)
        }

        generalButton.snp.makeConstraints {
            $0.top.equalTo(backButton)
            $0.leading.equalTo(bellButton.snp.trailing).offset(10)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(25)
            $0.width.height.equalTo(72)
        }
        
        profileLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(25)
        }
        
        shiftButton.snp.makeConstraints {
            $0.centerY.equalTo(profileImage)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        membershipView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(30)
            $0.height.equalTo(92)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        myTicketLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(12)
        }
        
        ticketLabel.snp.makeConstraints {
            $0.top.equalTo(myTicketLabel)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        myCashLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-18)
            $0.leading.equalToSuperview().offset(12)
        }
        
        cashLabel.snp.makeConstraints {
            $0.top.equalTo(myCashLabel)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        advertisementView.snp.makeConstraints {
            $0.top.equalTo(membershipView.snp.bottom).offset(12)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        advertisementLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(advertisementView.snp.bottom).offset(30)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

extension MyPageViewController: UITableViewDelegate {}

extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
}
