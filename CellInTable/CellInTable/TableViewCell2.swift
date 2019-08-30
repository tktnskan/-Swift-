//
//  TableViewCell2.swift
//  CellInTable
//
//  Created by Jinyung Yoon on 30/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class TVC2: UITableViewCell {
    
//    var t : UICollectionViewDelegate? = nil
    
//    func setDelegate(delegate: UICollectionViewDelegate){
//        t = delegate
//    }
    
    var col: UICollectionView = {
        let cl = UICollectionView()
        
        return cl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(col)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
