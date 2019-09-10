//
//  ViewController.swift
//  EmployeeManagement
//
//  Created by kings on 08/09/2019.
//  Copyright © 2019 kings. All rights reserved.
//

import UIKit
import Alamofire

class HomeVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    
    @IBOutlet var BtnLogin: UIButton!
    @IBOutlet weak var SignUpStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfID.delegate = self
        tfPW.delegate = self
        
        SignUpStart.addTarget(self, action: #selector(MovePage), for: .touchUpInside)
    }
    
    @IBAction func loginButtonEvent(_ sender: Any) {
        
        keyboardHide()
        
        if isIdAndPwInput() == true {
            signIn(email: self.tfID.text!, password: self.tfPW.text!)
        }
    }
    
    func SignInCom() {
        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "firstPage")
        
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc
    func MovePage() {
        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "naviSignUp")
        
        present(nextVC, animated: true, completion: nil)
    }

//MARK: - UITextField Event
    
    //화면 여백 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "로그인 실패",message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func signIn(email:String,password:String){
        
        let call = AF.request("https://manageemployee-f5411.firebaseio.com/.json", method: .get, encoding: JSONEncoding.default)
        
        call.responseJSON { res in
            guard let jsonOjbect = res.value as? NSDictionary else {
                let alert = UIAlertController(title: nil, message: "아이디와 비밀번호를 확인해주세요.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
                return
            }
            
            guard let jsonOjbect2 = jsonOjbect["user"] as? NSDictionary else {
                print("실패")
                return
            }
            
            let getEmail = jsonOjbect2["email"] as! String
            let getPassword = jsonOjbect2["password"] as! String
            
            if getEmail == self.tfID.text! && getPassword == self.tfPW.text! {
                let alert = UIAlertController(title: nil, message: "로그인 되었습니다.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                    let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "firstPage")
                    
                    self.present(nextVC, animated: true, completion: nil)
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: nil, message: "아이디와 비밀번호를 확인해주세요.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    /**
     * @brief 키보드 숨기기
     *
     * @param 없음
     *
     * @return void
     */
    func keyboardHide() {
        
        tfID.resignFirstResponder()
        tfPW.resignFirstResponder()
    }
    
    /**
     * @brief 텍스트 필드 입력값 체크
     *
     * @param 없음
     *
     * @return BOOL 성공:TRUE 실패:FALSE
     */
    func isIdAndPwInput() -> Bool {
        
        if (tfID.text ?? "").isEmpty || (tfPW.text ?? "").isEmpty {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                //alert 띄우기
                let alert = UIAlertController(title: nil, message: "ID 또는 PW를 입력해주세요.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
            return false
        }
        return true
    }
    
//MARK: - UITextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == tfID {
            tfPW.becomeFirstResponder()
            
        } else {
            tfPW.resignFirstResponder()
            loginButtonEvent((Any).self)
        }
        
        return true
    }
}
