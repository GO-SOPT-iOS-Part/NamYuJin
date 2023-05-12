//
//  TileViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/09.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit

class TileViewController: UIViewController {
    
    private var testView: UIView = {
        let view1 = UIView()
        view1.backgroundColor = .yellow
        return view1
    }()
    private var testView2: UIView = {
        let view2 = UIView()
        view2.backgroundColor = .green
        return view2
    }()
    private var testView3: UIView = {
        let view3 = UIView()
        view3.backgroundColor = .black
        return view3
    }()
    private var testView4: UIView = {
        let view4 = UIView()
        view4.backgroundColor = .blue
        return view4
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension TileViewController {
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubviews(testView, testView2, testView3, testView4)
        
        testView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height/4)
            $0.width.equalTo(UIScreen.main.bounds.width/2)
        }
        //        testView2.snp.makeConstraints {
//            $0.top.equalTo(testView.snp.bottom)
//            $0.leading.equalTo(UIScreen.main.bounds.width/2)
//            $0.bottom.equalTo(UIScreen.main.bounds.height/2)
//        }
//        testView3.snp.makeConstraints {
//            $0.top.equalTo(testView2.snp.bottom)
//            $0.trailing.equalTo(UIScreen.main.bounds.width/2)
//            $0.bottom.equalTo(UIScreen.main.bounds.height/4 * 3)
//        }
//        testView4.snp.makeConstraints {
//            $0.top.equalTo(testView3.snp.bottom)
//            $0.bottom.equalToSuperview()
//            $0.leading.equalTo(UIScreen.main.bounds.width/2)
//        }
        
    }
    
}
