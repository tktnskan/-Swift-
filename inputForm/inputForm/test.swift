//
//  test.swift
//  inputForm
//
//  Created by Jinyung Yoon on 12/08/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import Foundation


class A {
    var a = 0
    
    init(v: Int){
        
    }
    
//    convenience init(m: Int){
//        self.init(v: m)
//    }
}

class B: A {
    var b = 0
    
    convenience init(f: Int){
        self.init(v: f)
    }
}


let b1 = B(f: 0)
let b2 = B(v: 0)
//let b3 = B(m: 0)
