//
//  MemoCell.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class AddCell: UITableViewCell {
    var subject: UILabel = {
        let sj = UILabel()
        sj.textColor = .black
        return sj
    }()
    
    var contents: UITextView = {
        let a = UITextView()
        a.frame = CGRect(x: 10, y: 150, width: 300, height: 300)
        a.backgroundColor = .gray
        return a
    }()
    
    var regdate: UILabel = {
        let rd = UILabel()
        rd.textColor = .black
        return rd
    }()
    
    
    var img: UIImageView = {
        let i = UIImageView()
        i.frame = CGRect(x: 10, y: 480, width: 300, height: 300)
        
        return i
    }()
    
    var title: UITextView = {
        let tt = UITextView()
        tt.frame = CGRect(x: 10, y: 100, width: 300, height: 30)
        tt.backgroundColor = .gray
        return tt
    }()
}
