//
//  DataManager.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import Foundation

//class DataManager {
//    private static var memolist = [MemoData]()
//    private static var id: Int = 0
//
//    func save(d: MemoData) {
//        DataManager.memolist.append(d)
//    }
//
//    func listsize() -> Int {
//        return DataManager.memolist.count
//    }
//
//    func getlist() -> [MemoData] {
//        return DataManager.memolist
//    }
//
//    func idcheck() -> Int {
//        DataManager.id += 1
//        return DataManager.id
//    }
//}

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
    
    
    private var memolist = [MemoData]()
    private var id: Int = 0
    
    func save(d: MemoData) {
        memolist.append(d)
    }
    
    func listsize() -> Int {
        return memolist.count
    }
    
    func getlist() -> [MemoData] {
        return memolist
    }
    
    func idcheck() -> Int {
        id += 1
        return id
    }
}
