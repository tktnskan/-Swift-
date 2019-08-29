//
//  HomeVC.swift
//  CellInTable
//
//  Created by Jinyung Yoon on 28/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {
    
    var randomTitle = ["1", "2", "3", "4", "5", "6"]
    var randomContents = ["1번째입니다", "2번째입니다", "3번째입니다", "4번째입니다", "5번째입니다", "6번째입니다"]
    
    var tableViewcell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalCell")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
            cell.backgroundColor = UIColor.groupTableViewBackground
            return cell
            
        } else {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath as IndexPath)
            cell.textLabel?.text = "cell: \(indexPath.row)"
            
            return cell
        }
    }

}
