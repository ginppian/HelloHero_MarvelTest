//
//  MarvelURL.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelURL: NSObject {
    
    fileprivate var _type: String?
    fileprivate var url: String?
    
    init(_ _type: String,
         _ url: String) {
        
        self._type = _type
        self.url = url
    }
    
    convenience public init(json: NSDictionary) {
        
        let _type = json["type"] as? String ?? String()
        let url = json["url"] as? String ?? String()
        
        self.init(_type, url)
    }
    
    override public init() {
        super.init()
        
        self._type = String()
        self.url = String()
    }
    
    public var _Type: String {
        get {
            return self._type ?? String()
        }
        set {
            self._type = newValue
        }
    }
    
    public var Url: String {
        get {
            return self.url ?? String()
        }
        set {
            self.url = newValue
        }
    }
}
