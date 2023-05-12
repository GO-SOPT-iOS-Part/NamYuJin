//
//  WeatherNetworkResult.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/06.
//  Copyright © 2023 남유진. All rights reserved.
//

import Foundation

enum WeatherNetworkResult<T> {
    case success(T)     // 서버 통신 성공
    case requestErr(T)  // 요청에러 발생
    case pathErr // 경로 에러
    case serverErr  // 서버 내부 에러
    case networkErr // 네트워크 연결 실패
}
