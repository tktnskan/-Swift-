//
//  CSTableBarController.swift
//  inputForm
//
//  Created by Jinyung Yoon on 12/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class CSTabBarController: UITabBarController {
    
    
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.tabBar.isHidden = true
        
        self.csView.frame = CGRect(x: 0, y: self.view.frame.height - 130, width: self.view.frame.width, height: 50)
        self.csView.backgroundColor = .brown
        self.view.addSubview(self.csView)
        
        let tabItemWidth = self.csView.frame.width / 3
        let tabItemHeight = self.csView.frame.height
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabItemWidth, height: tabItemHeight)
        self.tabItem02.frame = CGRect(x: tabItemWidth, y: 0, width: tabItemWidth, height: tabItemHeight)
        self.tabItem03.frame = CGRect(x: tabItemWidth * 2, y: 0, width: tabItemWidth, height: tabItemHeight)
        
        self.addTabBarBtn(title: "첫번째버튼", btn: self.tabItem01, tag: 0)
        self.addTabBarBtn(title: "두번째버튼", btn: self.tabItem02, tag: 1)
        self.addTabBarBtn(title: "세번째버튼", btn: self.tabItem03, tag: 2)
        
        self.clickTabBarItem(self.tabItem01)
    }
    
    func addTabBarBtn(title: String, btn: UIButton, tag: Int) {
        btn.setTitle(title, for: .normal)
        btn.tag = tag
//        print(btn.titleLabel?.text)
        print(btn.tag)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.red, for: .selected)
        
        btn.addTarget(self, action: #selector(clickTabBarItem(_:)), for: .touchUpInside)
        self.csView.addSubview(btn)
    }
    
    @objc
    func clickTabBarItem(_ sender: UIButton) {
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        print("클릭됨")
        
        sender.isSelected = true
        
        self.selectedIndex = sender.tag
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
