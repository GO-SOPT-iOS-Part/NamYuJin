//
//  MyPage.swift
//  Tiving_clone_coding
//
//  Created by 남유진 on 2023/05/03.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

struct MyPage {
    let title: String
    let image: UIImage
}

extension MyPage {
    static func dummy() -> [MyPage] {
        return [MyPage(title: "이용권", image: .nextbutton),
                MyPage(title: "1:1 문의내역", image: .nextbutton),
                MyPage(title: "예약알림", image: .nextbutton),
                MyPage(title: "회원정보 수정", image: .nextbutton),
                MyPage(title: "프로모션 정보 수신 동의", image: .nextbutton),
                MyPage(title: "공지사항", image: .nextbutton),
                MyPage(title: "이벤트", image: .nextbutton),
                MyPage(title: "고객센터", image: .nextbutton),
                MyPage(title: "티빙 알아보기", image: .nextbutton)
            ]
    }
}

