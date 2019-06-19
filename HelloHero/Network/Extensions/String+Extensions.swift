//
//  String+Extensions.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

extension String {
    public static let Empty = String()
}

extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
