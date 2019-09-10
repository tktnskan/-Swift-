//
//  BasicInfoVC.swift
//  EmployeeManagement
//
//  Created by Jinyung Yoon on 08/09/2019.
//  Copyright © 2019 kings. All rights reserved.s
//

import UIKit

class BasicInfoVC: UIViewController, UITextFieldDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userPasswordCheck: UITextField!
    @IBOutlet weak var userMobile: UITextField!
    
    @IBOutlet weak var termsAgreement: UIButton!
    @IBOutlet weak var nextPage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEmail.delegate = self
        userName.delegate = self
        userPassword.delegate = self
        userPasswordCheck.delegate = self
        userMobile.delegate = self
        userName.autocorrectionType = UITextAutocorrectionType.no
        
        termsAgreement.isSelected = false
        termsAgreement.addTarget(self, action: #selector(isClicked), for: .touchUpInside)
        
        nextPage.addTarget(self, action: #selector(didClick), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func back(_ sender: Any) {
        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "Home")
        
        present(nextVC, animated: true, completion: nil)
    }
    @objc
    func isClicked() {
        if termsAgreement.isSelected == false {
            termsAgreement.setImage(UIImage(named: "check_checked"), for: .normal)
        } else {
            termsAgreement.setImage(UIImage(named: "check_uncheck"), for: .normal)
        }
        termsAgreement.isSelected = !termsAgreement.isSelected
    }
    
    @objc
    func didClick() {
        
        if isIdAndPwInput() == true {
            
            if termsAgreement.isSelected == true {
                if self.userPassword.text == self.userPasswordCheck.text {
                    if type(of: self.userMobile.text) != Int.self {
                        appDelegate.user = NewUserInfo(email: userEmail.text!, password: userPassword.text!, name: userName.text!, mobile: userMobile.text!)
                        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "SelectPostion")
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    } else {
                        let alert = UIAlertController(title: nil, message: "휴대폰번호 입력형식이 다릅니다.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    }
                    
                } else {
                    let alert = UIAlertController(title: nil, message: "비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                    self.userPassword.text = ""
                    self.userPasswordCheck.text = ""
                    
                    self.reloadInputViews()
                }
            } else {
                let alert = UIAlertController(title: nil, message: "약관동의를 해주세요.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    func isIdAndPwInput() -> Bool {
        
        if (userName.text ?? "").isEmpty || (userMobile.text ?? "").isEmpty || (userPassword.text ?? "").isEmpty {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                //alert 띄우기
                let alert = UIAlertController(title: nil, message: "필수입력정보를 입력해주세요", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
            return false
        }
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
