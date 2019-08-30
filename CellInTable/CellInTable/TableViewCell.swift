//
//  TableViewCell.swift
//  CellInTable
//
//  Created by Jinyung Yoon on 29/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class TVC: UITableViewCell {
    
    var data: Data? {
        didSet{
            title.text = data?.title
            content.text = data?.contents
        }
    }
    
    private let title: UILabel = {
        let tt = UILabel()
        tt.textColor = .black
        
        return tt
    }()
    
    private let content: UILabel = {
        let tt = UILabel()
        tt.textColor = .black
        
        return tt
    }()
    
//    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(content)
        title.frame = CGRect(x: 5, y: 5, width: 200, height: 20)
        content.frame = CGRect(x: 5, y: 30, width: 200, height: 20)
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
//
//        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
//        collectionView.backgroundColor = UIColor.clear
        
//        self.addSubview(collectionView)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: UICollectionViewDataSource
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as! CollectionViewCell
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = UIColor.red
//        } else {
//            cell.backgroundColor = UIColor.yellow
//        }
//        
//        return cell
//    }

}
