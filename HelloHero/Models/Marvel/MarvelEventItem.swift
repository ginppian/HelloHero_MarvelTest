//
//  EventItem.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelEventItem: NSObject {
    
    fileprivate var resourceURI: String?
    fileprivate var name: String?
    
    init(_ resourceURI: String,
         _ name: String) {
        
        self.resourceURI = resourceURI
        self.name = name
    }
    
    convenience public init(json: NSDictionary) {
        
        let resourceURI = json["resourceURI"] as? String ?? String()
        let name = json["name"] as? String ?? String()
        
        self.init(resourceURI, name)
    }
    
    override public init() {
        super.init()
        
        self.resourceURI = String()
        self.name = String()
    }
    
    public var ResourceURI: String {
        get {
            return self.resourceURI ?? String()
        }
        set {
            self.resourceURI = newValue
        }
    }
    
    public var Name: String {
        get {
            return self.name ?? String()
        }
        set {
            self.name = newValue
        }
    }
}
