//
//  HomeVC.swift
//  CellInTable
//
//  Created by Jinyung Yoon on 28/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    let cccc = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let item = data2[indexPath.row]
        cell.page = item
        
        // Configure the cell
        
        return cell
    }
    

    var data2 = DataManager().making().getting()
//    var tableview: UITableView!
    
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        hihi.making()
//        data2 = hihi.getting()
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(data2)
        tableView.register(TVC.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(TVC2.self, forCellReuseIdentifier: "TableViewCell2")
        
        cccc.delegate = self
        cccc.dataSource = self
        cccc.layour
        cccc.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
//        print("hihi")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("1111")
//        print(data2)
        return data2.count + 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print("hi3")
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("hi")
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as! TVC2
            cell.col = cccc
//            let colcell = col.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TVC
            let item = data2[indexPath.row-1]
            cell.data = item
            return cell
        }
//        cell.backgroundColor = .red
        
    }

}
