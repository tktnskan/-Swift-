//
//  ViewController.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 13/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
//        let tableView = UITableView()
//
//        view.addSubview(tableView)
        super.viewDidLoad()
        title = "Friends" //---1
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add,target: self, action:#selector(add))//---2

        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    @objc func add(){
        
    }
}

