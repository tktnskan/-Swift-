//
//  extraInfoVC.swift
//  EmployeeManagement
//
//  Created by Jinyung Yoon on 08/09/2019.
//  Copyright © 2019 kings. All rights reserved.
//

import UIKit

class extraInfoVC: UIViewController {
    @IBOutlet weak var storeName: UITextField!
    @IBOutlet weak var storeNumber: UITextField!
    @IBOutlet weak var storeAddress: UITextField!
    @IBOutlet weak var storeMobile: UITextField!
    
    @IBOutlet weak var signUpCom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpCom.addTarget(self, action: #selector(gogo), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
        
    }
    
    @objc
    func gogo() {
        let alert = UIAlertController(title: nil, message: "회원가입 되었습니다.", preferredStyle: .alert)
    
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
    
            self.showNextVC()
    
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    func showNextVC() {
        let nextVC = self.storyboard!.instantiateViewController(withIdentifier: "firstPage")
        
        present(nextVC, animated: true, completion: nil)
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
