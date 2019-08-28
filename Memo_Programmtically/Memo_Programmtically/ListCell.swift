//
//  ListCell.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    var data: MemoData? {
        didSet{
            title.text = data?.subject
            content.text = data?.contents
            preImage.image = data?.image
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
    
    private let preImage: UIImageView = {
        let tt = UIImageView()
        tt.contentMode = .scaleAspectFit
        tt.clipsToBounds = true
        return tt
    }()


    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(content)
        addSubview(preImage)
        title.frame = CGRect(x: 5, y: 5, width: 200, height: 20)
        content.frame = CGRect(x: 5, y: 30, width: 200, height: 20)
        preImage.frame = CGRect(x: 220, y: 0, width: 100, height: 100)
        //        title.textColor = .red
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
