//
//  ListCell.swift
//  MVC_Repeat
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var data: Data? {
        didSet{
            title.text = data?.title
        }
    }
    
    private let title: UILabel = {
        let tt = UILabel()
        tt.textColor = .black
        
        return tt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("1111111111111")
        addSubview(title)
        title.frame = CGRect(x: 5, y: 5, width: 100, height: 20)
//        title.textColor = .red
        print("asdasdasdasdsadsad")
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
