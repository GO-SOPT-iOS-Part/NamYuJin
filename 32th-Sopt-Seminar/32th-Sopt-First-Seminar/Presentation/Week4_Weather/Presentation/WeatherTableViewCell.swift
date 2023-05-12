//
//  WeatherTableViewCell.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/12.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then
import Alamofire

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    
    let weatherImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 24)
    }
    
    let temperatureLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
    }
    
    let humidityLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
    }
    
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
        separatorInset.left = 0
        selectionStyle = .none
        backgroundColor = .white
    }
    
    func setLayout() {
        [weatherImage, nameLabel, temperatureLabel, humidityLabel].forEach { contentView.addSubview($0) }
        
        weatherImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        humidityLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
    func configureCell(_ weather : WeatherResponse) {
        if let imageURL = weather.weather.first?.icon {
            weatherImage.getImageFromURL(imageURL)
        }
        
        nameLabel.text = weather.name
        
        let temp  = String(weather.main.temp)
        temperatureLabel.text = "현재 온도 : " + temp + "°C"
        
        let humidity  = String(weather.main.humidity)
        humidityLabel.text = "습도 : " + humidity + "%"
        
    }
}
