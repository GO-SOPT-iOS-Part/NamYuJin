//
//  FIrstViewController.swift
//  Sopt-First-Homework
//
//  Created by 남유진 on 2023/04/05.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

class FIrstViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: 1, height: 2)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .magenta
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(srgbRed: 0.5, green: 0.5, blue: 0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .magenta
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(srgbRed: 0.5, green: 0.5, blue: 0, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(pushButtonTapped),
    for: .touchUpInside)
        
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        label.backgroundColor = UIColor.gray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.textColor = UIColor.white
        label.shadowColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = NSTextAlignment.center
        label.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        label.text = "On"

        return label
    }()

    private lazy var controlSwitch: UISwitch = {
        let swicth = UISwitch()
        swicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)

        // Display the border of Swicth.
        swicth.tintColor = UIColor.orange

        // Set Switch to On.
        swicth.isOn = true

        // Set the event to be called when switching On / Off of Switch.
        swicth.addTarget(self, action: #selector(onClickSwitch(sender:)), for: UIControl.Event.valueChanged)

        return swicth
    }()
    
//    private let valueSlider: UISlider = {
//        let slider = UISlider(frame: CGRect(x:0, y:0, width:200, height:30))
//        slider.backgroundColor = UIColor.white
//        slider.layer.cornerRadius = 10.0
//        slider.layer.shadowOpacity = 0.5
//        slider.layer.masksToBounds = false
//
//        slider.minimumValue = 0
//        slider.maximumValue = 100
//        slider.value = 50
//
//        slider.isContinuous = true
//        slider.addTarget(self, action: #selector(onChangeValueSlider(sender:)), for: .valueChanged)
//        return slider
//    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        setLayout()
    }
}
private extension FIrstViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton, label, controlSwitch].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
                                     label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     label.heightAnchor.constraint(equalToConstant: 48)])

        NSLayoutConstraint.activate([controlSwitch.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                                     controlSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     controlSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     controlSwitch.heightAnchor.constraint(equalToConstant: 48)])
                                    
        
//        NSLayoutConstraint.activate([valueSlider.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
//                                     valueSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//                                     valueSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//                                     valueSlider.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
            let secondViewController = SecondViewController()
    //        if let name = nameTextField.text {
    //            secondViewController.dataBind(name: name)
    //        }
            guard let name = nameTextField.text else { return }
            secondViewController.name = name
            secondViewController.modalPresentationStyle = .fullScreen
            self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        let secondViewController = SecondViewController()
        guard let name = nameTextField.text else { return }
        secondViewController.name = name
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
    }

//    @objc func onChangeValueSlider(sender: UISlider){
//
//       // Change the green value of the background of the view according to the value of Slider.
//       self.view.backgroundColor = UIColor(red: 0, green: CGFloat(sender.value), blue: 0, alpha: 1)
//
//       // Instantiate CIFilter with color effect specified.
//       let colorFilter = CIFilter(name: "CIColorCrossPolynomial")
//
//
//       // Create converted value of RGB.
//       let r: [CGFloat] = [0.0, CGFloat(sender.value), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
//       let g: [CGFloat] = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
//       let b: [CGFloat] = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
//
//       // Adjust the value.
//       colorFilter!.setValue(CIVector(values: r, count: 10), forKey: "inputRedCoefficients")
//       colorFilter!.setValue(CIVector(values: g, count: 10), forKey: "inputGreenCoefficients")
//       colorFilter!.setValue(CIVector(values: b, count: 10), forKey: "inputBlueCoefficients")
//   }
    
    @objc func onClickSwitch(sender: UISwitch) {
        var text: String!
        var color: UIColor!

        if sender.isOn {
            text = "On"
            color = UIColor.gray
        } else {
            text = "Off"
            color = UIColor.orange
        }

        self.label.text = text
        self.label.backgroundColor = color
    }

}


