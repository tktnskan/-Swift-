//
//  CollectionViewCell.swift
//  CellInTable
//
//  Created by Jinyung Yoon on 29/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var page: Data? {
        didSet {
            title.text = page?.title
            contents.text = page?.contents
        }
    }
    
    private let title: UILabel = {
        let tt = UILabel()
        tt.textColor = .black
        
        return tt
    }()
    
    private let contents: UILabel = {
        let ct = UILabel()
        ct.textColor = .black
        
        return ct
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(title)
        addSubview(contents)
//        title.frame = CGRect(x: 5, y: 5, width: 30, height: 20)
//        contents.frame = CGRect(x: 5, y: 30, width: 30, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
