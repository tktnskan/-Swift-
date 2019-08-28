//
//  DetailVC.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var label1: UILabel = {
        let lb = UILabel()
        lb.sizeToFit()
        lb.frame = CGRect(x: 10, y: 100, width: 300, height: 30)
        return lb
    }()
    
    var label2: UILabel = {
        let lb = UILabel()
        lb.sizeToFit()
        lb.frame = CGRect(x: 10, y: 150, width: 300, height: 300)
        
        return lb
    }()
    
    var image: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 10, y: 470, width: 300, height: 300)
        
        return img
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(image)
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
