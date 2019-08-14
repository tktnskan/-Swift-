//
//  MemoCell.swift
//  CRUD
//
//  Created by Jinyung Yoon on 14/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contents: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none // --- 1
    }
}
