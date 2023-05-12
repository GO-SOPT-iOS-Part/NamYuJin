//
//  WeatherService.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/10.
//  Copyright © 2023 남유진. All rights reserved.
//

import Foundation

import Alamofire

final class WeatherService {
    
    static let shared = WeatherService()
    
    private init() {}
    
    private func makeUrl(place : String) -> String {
        return "https://api.openweathermap.org/data/2.5/weather?q=\(place)&appid=4fa392774270db4e062c9799460ae6c6"
    }
    
    func Weather (place : String,
                  completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(makeUrl(place: place),
                                     method: .get,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure :
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 404, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
       
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(WeatherResponse.self, from: data) else { return .pathErr }
        return .success(decodedData as Any)
    }
}
