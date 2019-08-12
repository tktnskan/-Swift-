//
//  NewAppDelegate.swift
//  inputForm
//
//  Created by Jinyung Yoon on 09/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit
//
@UIApplicationMain
class NewAPpDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        self.window?.rootViewController = tbC
        
        let nC1 = UINavigationController()
        let nC2 = UINavigationController()
        let nC3 = UINavigationController()
        
        let view01 = FirstVC()
        let view02 = SecondVC()
        let view03 = ThirdVC()
        
        nC1.setViewControllers([view01], animated: false)
        nC2.setViewControllers([view02], animated: false)
        nC3.setViewControllers([view03], animated: false)
        
        tbC.setViewControllers([nC1, nC2, nC3], animated: false)
        
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
        
        let tbItemProxy = UITabBarItem.appearance()
        
        tbItemProxy.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.gray], for: .disabled)
        tbItemProxy.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.red], for: .selected)
        tbItemProxy.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont.systemFont(ofSize: 15)], for: .normal)
        
        return true
    }
    
}
