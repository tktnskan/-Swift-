//
//  CSButton.swift
//  inputForm
//
//  Created by Jinyung Yoon on 12/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

public enum CSButtonType {
    case rect
    case circle
}

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
    
    convenience init(type: CSButtonType){
        self.init()
        switch type {
        case .rect:
            self.backgroundColor = .black
            self.layer.borderColor = UIColor.red.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitleColor(.white, for: .normal)
            self.setTitle("Rect Button", for: .normal)
            
        case .circle:
            self.backgroundColor = .black
            self.layer.borderColor = UIColor.red.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 50
            self.setTitle("Circle Button", for: .normal)
        }
        
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
        
    }
    
    var style: CSButtonType = .rect {
        didSet {  // 프로퍼티 옵저버
            switch style {
                case .rect:
                    self.backgroundColor = .black
                    self.layer.borderColor = UIColor.red.cgColor
                    self.layer.borderWidth = 2
                    self.layer.cornerRadius = 0
                    self.setTitleColor(.white, for: .normal)
                    self.setTitle("Rect Button", for: .normal)
                
                case .circle:
                    self.backgroundColor = .black
                    self.layer.borderColor = UIColor.red.cgColor
                    self.layer.borderWidth = 2
                    self.layer.cornerRadius = 50
                    self.setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    @objc
    func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag)번 클릭", for: .normal)
    }
}


