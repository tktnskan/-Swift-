//
//  ThirdVC.swift
//  inputForm
//
//  Created by Jinyung Yoon on 09/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let title = UILabel(frame: CGRect(x: 0, y: 130, width: 100, height: 30))
        
        title.text = "세 번쨰 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.sizeToFit()
        title.center.x = self.view.frame.width / 2
        

        // Do any additional setup after loading the view.
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row)")
    }
    
    func setButton() {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        btn.center.x = self.view.frame.width / 2
        btn.setTitle("Map Alert", for: .normal)
        btn.addTarget(self, action: #selector(alertMap(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let btn2 = UIButton(type: .system)
        btn2.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        btn2.center.x = self.view.frame.width / 2
        btn2.setTitle("Image Alert", for: .normal)
        btn2.addTarget(self, action: #selector(alertImage(_:)), for: .touchUpInside)
        self.view.addSubview(btn2)
        
        let btn3 = UIButton(type: .system)
        btn3.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        btn3.center.x = self.view.frame.width / 2
        btn3.setTitle("Slider Alert", for: .normal)
        btn3.addTarget(self, action: #selector(alertSlider(_:)), for: .touchUpInside)
        self.view.addSubview(btn3)
        
        let btn4 = UIButton(type: .system)
        btn4.frame = CGRect(x: 0, y: 350, width: 100, height: 30)
        btn4.center.x = self.view.frame.width / 2
        btn4.setTitle("List Alert", for: .normal)
        btn4.addTarget(self, action: #selector(alertList(_:)), for: .touchUpInside)
        self.view.addSubview(btn4)
    }
    
    @objc
    func alertMap(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        let cancelAction = UIAlertAction(title: "cancel", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let contentVC = MapKitVC()
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: true)
    }
    
    @objc
    func alertImage(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "평점", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        let cancelAction = UIAlertAction(title: "cancel", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let contentVC = ImageVC()
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: true)
    }

    
    @objc
    func alertSlider(_ sender: Any) {
        let contentVC = ControlVC()
        
        let alert = UIAlertController(title: nil, message: "슬라이더 평점 \n \(contentVC.sliderValue)", preferredStyle: .alert)
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let okAction = UIAlertAction(title: "ok", style: .default) { (_) in print("sliderValue = \(contentVC.sliderValue)")}
        alert.addAction(okAction)
        
        self.present(alert, animated: false)
    }
    
    @objc
    func alertList(_ sender: Any) {
        
        let contentVC = ListVC()
        
        contentVC.delegate = self
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: false)
        
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
