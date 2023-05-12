//
//  ViewController_AutoLayout.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/09.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

import SnapKit
import Then

class ViewController_AutoLayout: UIViewController {
    
//    private let testView = UIView()
//    private let testView2 = UIView()
//    private let testView3 = UIView()
//    private let testView4 = UIView()
//
//    func setStyle() {
//        view.backgroundColor = .white
//
//        testView.do{
//            $0.backgroundColor = .yellow
//        }
//        testView2.do{
//            $0.backgroundColor = .green
//        }
//        testView3.do{
//            $0.backgroundColor = .black
//        }
//        testView4.do{
//            $0.backgroundColor = .blue
//        }
//    }
    
    private let testView: UIView = {
           let view = UIView()
           view.backgroundColor = .yellow
           return view
       }()

       private let testView2: UIView = {
           let view = UIView()
           view.backgroundColor = .green
           return view
       }()

       private let testView3: UIView = {
           let view = UIView()
           view.backgroundColor = .black
           return view
       }()

       private let testView4: UIView = {
           let view = UIView()
           view.backgroundColor = .blue
           return view
       }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}
private extension ViewController_AutoLayout {
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
//        [testView, testView2, testView3, testView4].forEach{
//                    $0.translatesAutoresizingMaskIntoConstraints = false
//                    view.addSubview($0)
//                }
        view.addSubviews(testView, testView2, testView3, testView4)

        
        testView.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width/2)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
        testView2.snp.makeConstraints {
            $0.top.equalTo(testView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width/2)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
        testView3.snp.makeConstraints {
            $0.top.equalTo(testView2.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width/2)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
        testView4.snp.makeConstraints {
            $0.top.equalTo(testView3.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width/2)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
        
    }
    
}
