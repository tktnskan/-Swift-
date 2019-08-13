//
//  CSStepper.swift
//  inputForm
//
//  Created by Jinyung Yoon on 13/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit
@IBDesignable
public class CSStepper: UIControl {
    
    public var leftBtn = UIButton(type: .system)
    public var screen = UILabel()
    public var rightBtn = UIButton(type: .system)
    
    @IBInspectable
    public var value: Int = 0 {
        didSet {
            self.screen.text = String(value)
            self.sendActions(for: .valueChanged)
        }
    }
    
    @IBInspectable
    public var leftTitle: String = "↓" {
        didSet {
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var rightTitle: String = "↑" {
        didSet {
            self.leftBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet {
            self.screen.backgroundColor = backgroundColor
        }
    }
    
    @IBInspectable
    public var stepValue: Int = 1
    
    @IBInspectable
    public var maximumValue: Int = 100
    
    @IBInspectable
    public var minimumValue: Int = -100
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        let borderWidth: CGFloat = 0.5
        let borderColor: CGColor = UIColor.blue.cgColor
        print("ASdasdas")
        self.leftBtn.tag = -1
//        self.leftBtn.setTitle("↓", for: .normal)
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        
        self.rightBtn.tag = 1
//        self.rightBtn.setTitle("↑", for: .normal)
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        
        self.screen.text = String(value)
        self.screen.font = UIFont.boldSystemFont(ofSize: 16)
        self.screen.textAlignment = .center
        self.screen.layer.borderWidth = borderWidth
        self.screen.layer.borderColor = borderColor
//        self.screen.backgroundColor = UIColor.cyan
        self.screen.backgroundColor = self.bgColor
        
        
        self.leftBtn.addTarget(self, action: #selector(valueChanged(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChanged(_:)), for: .touchUpInside)
        
        self.addSubview(leftBtn)
        self.addSubview(rightBtn)
        self.addSubview(screen)
    }
    
    @objc
    public func valueChanged(_ sender: UIButton) {
        
        let sum = self.value + sender.tag * self.stepValue
        
        if sum > self.maximumValue || sum < self.minimumValue {
            return
        }
        
        self.value += sender.tag * self.stepValue
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        let lblWidth = self.frame.width - btnWidth * 2
        
        print("dddddddd")
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
        self.screen.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
    }
    
}
