//
//  ViewController.swift
//  MVC_Repeat
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data1 = DataManager.getInstance()
    let inputContents: UITextView = {
        let iC = UITextView()
        iC.backgroundColor = .gray
        iC.frame = CGRect(x: 20, y: 50, width: 200, height: 30)
        return iC
    }()
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("저장", for: .normal)
        btn.frame = CGRect(x: 230, y: 50, width: 30, height: 30)
        
        return btn
    }()
    
    let table: UITableView = {
        let tb = UITableView()
        tb.frame = CGRect(x: 20, y: 100, width: 350, height: 400)
        
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(inputContents)
        view.addSubview(button)
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.register(ListCell.self, forCellReuseIdentifier: "CellId")
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc
    func save(_ sender: UIButton) {
        let a = Data(title: inputContents.text)
        data1.save(a: a)
        print(data1.getList())
        inputContents.text = ""
        self.table.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data1.len()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! ListCell
        let item = data1.getList()[indexPath.row]
//        cell.textLabel?.text = item.title
//        cell.textLabel?.textColor = .red
//        cell.detailTextLabel?.text = item.title
//        cell.detailTextLabel?.textColor = .blue
        cell.data = item
        cell.tintColor = .red
        
        return cell
        
    }


}


