//
//  SelectPostionVC.swift
//  EmployeeManagement
//
//  Created by Jinyung Yoon on 08/09/2019.
//  Copyright © 2019 kings. All rights reserved.
//

import UIKit
import Alamofire

class SelectPostionVC: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var albaImage: UIImageView!
    @IBOutlet weak var sajangImage: UIImageView!
    @IBOutlet weak var positiondescription: UILabel!
    
    var albaChecked: Bool = false
    var sajangChecked: Bool = false
    
    var sajangContinue: UIButton = {
        let sc = UIButton(type: .system)
        sc.setTitle("추가정보 입력하기", for: .normal)
        sc.tintColor = .white
        sc.backgroundColor = .blue
        
        return sc
    }()
    
    var albaContinue: UIButton = {
        let ac = UIButton(type: .system)
        ac.setTitle("회원가입하기", for: .normal)
        ac.tintColor = .white
        ac.backgroundColor = .blue
        
        return ac
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albaImage.isUserInteractionEnabled = true
        sajangImage.isUserInteractionEnabled = true

        let albaTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(albaTapping))
        albaTap.numberOfTapsRequired = 1
        albaImage.addGestureRecognizer(albaTap)
        
        let sajangTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sajangTapping))
        sajangTap.numberOfTapsRequired = 1
        sajangImage.addGestureRecognizer(sajangTap)

        // Do any additional setup after loading the view.
    }
    
    func albasetup() {
        self.albaContinue.frame = CGRect(x: 0, y: view.frame.height - 60, width: view.frame.width, height: 60)
        self.view.addSubview(self.albaContinue)
        
        albaContinue.addTarget(self, action: #selector(clickAlba), for: .touchUpInside)
        
    }
    
    func sajangsetup() {
        self.sajangContinue.frame = CGRect(x: 0, y: view.frame.height - 60, width: view.frame.width, height: 60)
        self.view.addSubview(self.sajangContinue)
        
        sajangContinue.addTarget(self, action: #selector(clickSajang), for: .touchUpInside)
    }
    
    @objc
    func albaTapping() {
        if self.albaChecked == false && self.sajangChecked == false {
            albaImage.image = UIImage(named: "alba")
            self.albaChecked = true
        } else if self.sajangChecked == true && self.albaChecked == false {
            albaImage.image = UIImage(named: "alba")
            self.albaChecked = true
            sajangImage.image = UIImage(named: "sajang_no")
            self.sajangChecked = false
        }
        
        self.positiondescription.text = "알바를 선택하셨습니다."
        albasetup()
    }
    
    @objc
    func sajangTapping() {
        if self.albaChecked == false && self.sajangChecked == false {
            sajangImage.image = UIImage(named: "sajang")
            self.sajangChecked = true
        } else if self.albaChecked == true && self.sajangChecked == false {
            albaImage.image = UIImage(named: "alba_no")
            self.albaChecked = false
            sajangImage.image = UIImage(named: "sajang")
            self.sajangChecked = true
        }
        self.positiondescription.text = "사장을 선택하셨습니다."
        sajangsetup()
    }
    
    @objc
    func clickAlba() {
        let userdetail = appDelegate.user
        signUp(email: (userdetail?.email)!, password: (userdetail?.password)!, mobile: (userdetail?.mobile)!, name: (userdetail?.name)!)
    }
    
    @objc
    func clickSajang() {
        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "extraInfo")
        
        present(nextVC, animated: true, completion: nil)
    }
    
    func showFirstPage() {
        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "firstPage")
        
        present(nextVC, animated: true, completion: nil)
    }
    
    func signUp(email:String, password:String, mobile: String, name: String){
        let param: Parameters = [
            "email": email,
            "mobile": password,
            "name": name,
            "password": password
        ]
        var resultCode = ""
        
        let call = AF.request("https://manageemployee-f5411.firebaseio.com/user.json", method: .post, parameters: param, encoding: JSONEncoding.default)
        print(call)
        call.responseJSON { res in
            print(res)
            guard let jsonObject = res.value as? NSDictionary else {
                print("실패")
                return
            }
            print(jsonObject)
            resultCode = jsonObject["name"] as! String
            print(resultCode)
            if resultCode != "" {
                let alert = UIAlertController(title: nil, message: "회원가입 되었습니다.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                    
                    self.showFirstPage()
                    
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } else {
                
            }
        }
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
