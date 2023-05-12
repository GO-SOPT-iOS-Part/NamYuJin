//
//  Photo.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/27.
//  Copyright © 2023 남유진. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    let image: UIImage
    var heartTapped: Bool
}

extension Photo {
    static func dummy() -> [Photo] {
        var photos: [Photo] = []
        for number in 1...12 {
            photos.append(Photo(image: UIImage(named: "photo_\(number)")!,
                                heartTapped: false))
        }
        return photos + photos
    }
}
