//
//  MemoData.swift
//  Memo_Programmtically
//
//  Created by Jinyung Yoon on 27/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class MemoData {
    var memoIdx : Int? // 데이터 식별값
//    var title : String? // 메모 제목
    var contents: String? // 메모 내용
    var image : UIImage? // 이미지
    var regdate : Date? // 작성일
    var subject : String?
    
    init(memoIdx: Int, contents: String, regdate: Date, subject: String){
        self.memoIdx = memoIdx
//        self.title = title
        self.contents = contents
        self.regdate = regdate
        self.subject = subject
    }
    

}
