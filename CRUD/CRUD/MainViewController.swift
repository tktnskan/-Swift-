//
//  MainViewController.swift
//  CRUD
//
//  Created by Jinyung Yoon on 14/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var memoData: [MemoData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let MainTableView = UITableView()
        MainTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: view.frame.height)
        title = "Memo" //---1
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add,target: self, action:#selector(add))//---2
        
        self.view.backgroundColor = .black
        self.view.addSubview(MainTableView)
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


extension MainViewController {
    @objc func add(){
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell, for: indexPath) as! MemoCell
        cell.title.text = memoData[indexPath.row].title
        cell.contents.text = memoData[indexPath.row].contents
        return cell
    }
}

// MARK: UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
