//
//  Data.swift
//  CellInTable
//
//  Created by Jinyung Yoon on 30/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//
import UIKit

class Data {
    var title : String? // 메모 제목
    var contents: String?
    
    init(title: String, contents: String){
        self.title = title
        self.contents = contents
    }
}

class DataManager {
    static var data2 = [Data]()
    
    
    func making() -> DataManager {
        for i in 1...6 {
            DataManager.data2.append(Data(title: "\(i)", contents: "\(i)번째 글입니다."))
        }
        return self
    }
    
    func getting() -> [Data] {
        return DataManager.data2
    }

}
