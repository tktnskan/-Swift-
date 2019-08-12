//
//  CSButton.swift
//  inputForm
//
//  Created by Jinyung Yoon on 12/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class CSButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = .red
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
    }
}
