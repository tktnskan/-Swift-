//
//  ViewController.swift
//  inputForm
//
//  Created by Jinyung Yoon on 09/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        title.text = "첫 번쨰 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.sizeToFit()
        title.center.x = self.view.frame.width / 2
        
        self.view.addSubview(title)
        
        
        self.navigationItem.title = "설정"
        let font = UIFont(name: "chalkbalck SE", size: 14)
        
        let lblEmail = UILabel()
        lblEmail.text = "이메일"
        lblEmail.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblEmail.font = font
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 200, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect
        self.paramEmail.placeholder = "이메일 예) abcd@naver.com"
        self.paramEmail.autocapitalizationType = .none
        
        let lblUpdate = UILabel()
        lblUpdate.text = "자동갱신"
        lblUpdate.frame = CGRect(x: lblEmail.frame.origin.x, y: 250, width: 100, height: 30)
        lblUpdate.font = font
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: self.paramEmail.frame.origin.x, y: 250, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        
        let lblInterval = UILabel()
        lblInterval.text = "갱신주기"
        lblInterval.frame = CGRect(x: lblEmail.frame.origin.x, y: 300, width: 100, height: 30)
        lblInterval.font = font
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: self.paramEmail.frame.origin.x, y: 300, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 250, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "갱신함"
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 300, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        
        self.view.addSubview(lblEmail)
        self.view.addSubview(lblUpdate)
        self.view.addSubview(lblInterval)
        self.view.addSubview(self.paramEmail)
        self.view.addSubview(self.paramUpdate)
        self.view.addSubview(self.paramInterval)
        self.view.addSubview(self.txtUpdate)
        self.view.addSubview(self.txtInterval)
        
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_ :)))
        self.navigationItem.rightBarButtonItem = submitBtn
    }
    
    
    @objc
    func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
        self.txtUpdate.textColor = (sender.isOn == true ? UIColor.red : UIColor.black)
    }
    
    @objc
    func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("\( Int(sender.value) ) 분마다")
    }
    
    @objc
    func submit(_ sender: Any) {
        let nextVC = ReadViewController()
        nextVC.pEmail = self.paramEmail.text
        nextVC.pUpdate = self.paramUpdate.isOn
        nextVC.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}

