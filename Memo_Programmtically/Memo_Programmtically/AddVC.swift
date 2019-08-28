//
//  AddVC.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var memocell = AddCell()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(memocell.title)
        view.addSubview(memocell.contents)
        view.addSubview(memocell.img)
        
        self.memocell.contents.delegate = self
        
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(pickPhoto))
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveItem))
        self.navigationItem.rightBarButtonItems = [camera, save]
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc
    func saveItem(_ sender: Any) {
        let manager = DataManager.getInstance()
        let data = MemoData(
            memoIdx: manager.idcheck(),
            contents: memocell.contents.text,
            regdate: Date(),
            subject: "\(manager.listsize() + 1)번째 글: \(memocell.title.text!)"
        )
        data.image = memocell.img.image

        
        manager.save(d: data)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func pickPhoto(_ sender: Any) {
        let select = UIAlertController(title: "이미지를 선택해주세요", message: nil, preferredStyle: .actionSheet)
        
        select.addAction(UIAlertAction(title: "카메라", style: .default) { (_) in self.selectedPhoto(source: .camera)})
        select.addAction(UIAlertAction(title: "포토 라이브러리", style: .default) { (_) in self.selectedPhoto(source: .photoLibrary)})
        select.addAction(UIAlertAction(title: "저장 앨범", style: .default) { (_) in self.selectedPhoto(source: .savedPhotosAlbum)})
        
        
        self.present(select, animated: false)
    }
    
    func selectedPhoto(source: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(source) == true else {
            let alert = UIAlertController(title: "이미지 타입 오류", message: nil, preferredStyle: .alert)
            self.present(alert, animated: true)
            return
        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = source
        
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 선택된 이미지를 미리보기에 표시한다
        self.memocell.img.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
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
