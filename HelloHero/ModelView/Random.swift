//
//  Random.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class Random {
    public class func WaitingImg() -> String {
        let arr = ["w1", "w2", "w3", "w4", "w5", "w6"]
        return arr.randomElement() ?? "w4"
    }
}
