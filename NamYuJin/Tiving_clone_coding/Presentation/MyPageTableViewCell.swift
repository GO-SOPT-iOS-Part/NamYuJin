//
//  MyPageTableViewCell.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/05/03.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class MyPageTableViewCell: UITableViewCell {
    
    static let identifier = "MyPageTableViewCell"
    
    private let contentLabel = UILabel()
    private lazy var btnImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        self.backgroundColor = .black
        separatorInset.left = 0
        selectionStyle = .none
        
        contentLabel.do {
            $0.textColor = .white
            
        }
    }
    
    
    func setLayout() {
        [contentLabel, btnImage].forEach { contentView.addSubview($0) }
        
        contentLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        
        btnImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    func configureCell(_ mypage: MyPage) {
        contentLabel.text = mypage.title
        btnImage.image = mypage.image
    }
    

}
