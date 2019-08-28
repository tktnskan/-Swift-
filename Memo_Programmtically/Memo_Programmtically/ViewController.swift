//
//  ViewController.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 13/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class MyViewController: UITableViewController {
    
    let data = DataManager.getInstance()
    let cellId = "cellId"
    let alertController = UIAlertController(title: "Add New Item", message: "빈칸 채워", preferredStyle: .alert)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
    }
    
    func setup()
    {
        view.backgroundColor = .white
        navigationItem.title = "목록"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain
            , target: self, action: #selector(addItem))
        tableView.register(ListCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc
    func addItem(_ sender: Any) {
        let nextVC = AddVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getlist().count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        let item = data.getlist()[indexPath.row]
//        cell.textLabel?.text = item.subject
        cell.data = item
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        appDelegate.memolist.remove(at: indexPath.row)
//        tableView.reloadData()
        let item = data.getlist()[indexPath.row]
        print(item.contents)
        print(item.subject)
        
        let nextVC = DetailVC()
        nextVC.image.image = item.image
        nextVC.navigationItem.title = item.subject
        nextVC.label1.text = item.subject
        nextVC.label2.text = item.contents
        nextVC.label1.sizeToFit()
        nextVC.label2.sizeToFit()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}


