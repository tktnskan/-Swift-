//
//  ViewController.swift
//  inputForm
//
//  Created by Jinyung Yoon on 09/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        
//        self.initTitle()
        self.initTitleNew()
        
        let title = UILabel(frame: CGRect(x: 0, y: 130, width: 100, height: 30))
        
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
//        func exec() {
//            tabBar?.alpha = ( tabBar?.alpha == 1 ? 0: 1)
//        }
//
//        UIView.animate(withDuration: TimeInterval(0.3), animations: exec)
        
        UIView.animate(withDuration: TimeInterval(0.3) ) {
            tabBar?.alpha = ( tabBar?.alpha == 0 ? 1 : 0)
        }
    }
    
//
//    func initTitle() {
//        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
//
//        nTitle.numberOfLines = 2
//        nTitle.textAlignment = .center
//        nTitle.font = UIFont.systemFont(ofSize: 15)
//        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
//        nTitle.textColor = UIColor.white
//
//        self.navigationItem.titleView = nTitle
//
//        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
//    }
//
    func initTitleNew() {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = UIColor.white
        topTitle.text = "58개 숙소"
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = UIColor.white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationItem.titleView = containerView
        
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
    }
    
}

