//
//  WeatherViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/11.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit


class WeatherViewController: UIViewController {
    
    var weatherList: [WeatherResponse] = []
    
    private let tableView = UITableView()
    
    private let cityName = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWeather()
        setStyle()
        setLayout()
    }
    
    private func openWeather() {
//        WeatherService.shared.Weather(place: "gongju") { response in
//        switch response {
//        case .success(let data):
//            guard let data = data as? WeatherResponse else { return }
//            dump(data)
//        default:
//            return
//        }

        cityName.forEach {
            WeatherService.shared.Weather(place: $0) { response in
                switch response{
                case .success(let data) :
                    guard let data = data as? WeatherResponse else { return }
                    self.weatherList.append(data)
//                    print(self.weatherList.count)
//                    if self.weatherList.count == 20 {
//                        print(self.weatherList)
//                    }
                    self.tableView.reloadData()
                default:
                    return
                }
            }
        }
    }
    
    private func setStyle() {
        
        view.backgroundColor = .white
        
        tableView.do {
            $0.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
            $0.rowHeight = 100
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension WeatherViewController: UITableViewDelegate {}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        if (weatherList.count == cityName.count) {
            cell.configureCell(weatherList[indexPath.row])
        }
        return cell
    }
}
