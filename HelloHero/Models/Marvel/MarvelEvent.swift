//
//  Event.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelEvent: NSObject {
    
    fileprivate var available: Int?
    fileprivate var collectionURI: String?
    fileprivate var items: [MarvelEventItem]?
    fileprivate var returned: Int?
    
    init(_ available: Int,
         _ collectionURI: String,
         _ items: [MarvelEventItem],
         _ returned: Int) {
        
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
    
    convenience public init(json: NSDictionary) {
        let available = json["available"] as? Int ?? Int()
        let collectionURI = json["collectionURI"] as? String ?? String()
        
        let itemsRow = json["items"] as? [NSDictionary] ?? [NSDictionary]()
        var items = [MarvelEventItem]()
        for itemRow in itemsRow {
            let item = MarvelEventItem(json: itemRow)
            items.append(item)
        }
        
        let returned = json["returned"] as? Int ?? Int()
        
        self.init(available, collectionURI, items, returned)
    }
    
    override public init() {
        super.init()
        
        self.available = Int()
        self.collectionURI = String()
        self.items = [MarvelEventItem]()
        self.returned = Int()
    }
    
    public var Available: Int {
        get {
            return self.available ?? Int()
        }
        set {
            self.available = newValue
        }
    }
    
    public var CollectionURI: String {
        get {
            return self.collectionURI ?? String()
        }
        set {
            self.collectionURI = newValue
        }
    }
    
    public var Items: [MarvelEventItem] {
        get {
            return self.items ?? [MarvelEventItem]()
        }
        set {
            self.items = newValue
        }
    }
    
    public var Returned: Int {
        get {
            return self.returned ?? Int()
        }
        set {
            self.returned = newValue
        }
    }
}
