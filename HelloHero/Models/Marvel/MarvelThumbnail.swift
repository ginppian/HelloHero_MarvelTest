//
//  Thumbnail.swift
//  HelloHero
//
//  Created by Memo on 6/17/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelThumbnail: NSObject {
    
    fileprivate var path: String?
    fileprivate var _extension: String?
    
    init(_ path: String,
         _ _extension: String) {
        
        self.path = path
        self._extension = _extension
    }
    
    convenience public init(json: NSDictionary) {
        
        let path = json["path"] as? String ?? String()
        let _extension = json["extension"] as? String ?? String()
        
        self.init(path, _extension)
    }
    
    override public init() {
        super.init()
        
        self.path = String()
        self._extension = String()
    }
    
    public var Path: String {
        get {
            return self.path ?? String()
        }
        set {
            self.path = newValue
        }
    }
    
    public var Extension: String {
        get {
            return self._extension ?? String()
        }
        set {
            self._extension = newValue
        }
    }
}
