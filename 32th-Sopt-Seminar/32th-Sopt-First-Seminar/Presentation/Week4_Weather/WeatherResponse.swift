//
//  WeatherResponse.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/10.
//  Copyright © 2023 남유진. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}
