//
//  MemoCRUD.swift
//  CRUD
//
//  Created by Jinyung Yoon on 14/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class MemoCRUD: UIViewController {
    
    var memoData: [MemoData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: view.frame.height)
        
        title = "ADD Memo"
        
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


