//
//  Stories.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelStorie: NSObject {
    
    fileprivate var available: Int?
    fileprivate var collectionURI: String?
    fileprivate var items: [MarvelStorieItem]?
    fileprivate var returned: Int?
    fileprivate var _type: String?

    init(_ available: Int,
         _ collectionURI: String,
         _ items: [MarvelStorieItem],
         _ returned: Int,
         _ _type: String) {
        
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
        self._type = _type
    }
    
    convenience public init(json: NSDictionary) {
        let available = json["available"] as? Int ?? Int()
        let collectionURI = json["collectionURI"] as? String ?? String()
        
        let itemsRow = json["items"] as? [NSDictionary] ?? [NSDictionary]()
        var items = [MarvelStorieItem]()
        for itemRow in itemsRow {
            let item = MarvelStorieItem(json: itemRow)
            items.append(item)
        }
        
        let returned = json["returned"] as? Int ?? Int()
        let _type = json["type"] as? String ?? String()
        
        self.init(available, collectionURI, items, returned, _type)
    }
    
    override public init() {
        super.init()
        
        self.available = Int()
        self.collectionURI = String()
        self.items = [MarvelStorieItem]()
        self.returned = Int()
        self._type = String()
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
    
    public var Items: [MarvelStorieItem] {
        get {
            return self.items ?? [MarvelStorieItem]()
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
    
    public var _Type: String {
        get {
            return self._type ?? String()
        }
        set {
            self._type = newValue
        }
    }
}
