//
//  SignUpResponse.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/05/06.
//  Copyright © 2023 남유진. All rights reserved.
//

import Foundation

struct SignUpResponse: Codable {
    let code: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let userId: Int
    let nickname: String
}
