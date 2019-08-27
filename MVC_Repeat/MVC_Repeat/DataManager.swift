//
//  DataManager.swift
//  MVC_Repeat
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

class DataManager {
    
    private static var INSTANCE: DataManager? = nil
    
    
    static func getInstance() -> DataManager {
        if INSTANCE == nil {
            INSTANCE = DataManager()
        }
        
        return INSTANCE!
    }
    
    private init() {
        
    }
    
    private var dataList = [Data]()
    
    func save(a: Data) {
        dataList.append(a)
    }
    
    func len() -> Int {
        return dataList.count
    }
    
    func getList() -> [Data] {
        return dataList
    }
 }
