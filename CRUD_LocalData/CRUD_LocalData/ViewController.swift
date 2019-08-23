//
//  ViewController.swift
//  CRUD_LocalData
//
//  Created by Jinyung Yoon on 21/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class MyViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let cellId = "cellId"
    let alertController = UIAlertController(title: "Add New Item", message: "빈칸 채워", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "hi"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain
            , target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        tableView.register(Mycell.self, forCellReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
    }
    
    
    @objc
    func addItem(_ sender: Any) {
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: savehaza)
        let selfinput = UIViewController()
        let input = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        input.backgroundColor = .gray
        alertController.addAction(saveAction)
        selfinput.view = input
        selfinput.preferredContentSize.height = 100
        alertController.setValue(selfinput, forKey: "contentViewController")

//        alertController.view.addSubview(selfinput)
        present(alertController, animated: false)

    }
    
    func savehaza(a: UIAlertAction) {
        appDelegate.Items.append(a.title!)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.Items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! Mycell
        let item = appDelegate.Items[indexPath.row]
        cell.textLabel?.text = item
        cell.title = item
        print(item)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appDelegate.Items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}


class Mycell: UITableViewCell {
    var title: String = ""
}
