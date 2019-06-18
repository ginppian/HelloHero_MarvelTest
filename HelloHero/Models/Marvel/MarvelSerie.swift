//
//  Series.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelSerie: NSObject {
    
    fileprivate var available: Int?
    fileprivate var collectionURI: String?
    fileprivate var items: [MarvelSerieItem]?
    fileprivate var returned: Int?
    
    init(_ available: Int,
         _ collectionURI: String,
         _ items: [MarvelSerieItem],
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
        var items = [MarvelSerieItem]()
        for itemRow in itemsRow {
            let item = MarvelSerieItem(json: itemRow)
            items.append(item)
        }
        
        let returned = json["returned"] as? Int ?? Int()
        
        self.init(available, collectionURI, items, returned)
    }
    
    override public init() {
        super.init()
        
        self.available = Int()
        self.collectionURI = String()
        self.items = [MarvelSerieItem]()
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
    
    public var Items: [MarvelSerieItem] {
        get {
            return self.items ?? [MarvelSerieItem]()
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
