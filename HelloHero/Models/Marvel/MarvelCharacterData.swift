//
//  CharacterAllData.swift
//  HelloHero
//
//  Created by Memo on 6/17/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelCharacterData: NSObject {
    
    fileprivate var offset: Int?
    fileprivate var limit: Int?
    fileprivate var total: Int?
    fileprivate var count: Int?
    fileprivate var arrResults: [MarvelCharacter]?
    
    init(_ offset: Int,
         _ limit: Int,
         _ total: Int,
         _ count: Int,
         _ arrResults: [MarvelCharacter]) {
        
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.arrResults = arrResults
    }
    
    convenience public init(json: NSDictionary) {
        let offset = json["offset"] as? Int ?? Int()
        let limit = json["limit"] as? Int ?? Int()
        let total = json["total"] as? Int ?? Int()
        let count = json["count"] as? Int ?? Int()
        
        let arrResultsRow = json["results"] as? [NSDictionary] ?? [NSDictionary]()
        var arrResults = [MarvelCharacter]()
        for resultRow in arrResultsRow {
            let result = MarvelCharacter(json: resultRow)
            arrResults.append(result)
        }
        
        self.init(offset, limit, total, count, arrResults)
    }
    
    override public init() {
        super.init()
        
        self.offset = Int()
        self.limit = Int()
        self.total = Int()
        self.count = Int()
        self.arrResults = [MarvelCharacter]()
    }
    public var Offset: Int {
        get {
            return self.offset ?? Int()
        }
        set {
            self.offset = newValue
        }
    }
    
    public var Limit: Int {
        get {
            return self.offset ?? Int()
        }
        set {
            self.offset = newValue
        }
    }
    
    public var Total: Int {
        get {
            return self.offset ?? Int()
        }
        set {
            self.offset = newValue
        }
    }
    
    public var Count: Int {
        get {
            return self.offset ?? Int()
        }
        set {
            self.offset = newValue
        }
    }
    
    public var ArrResults: [MarvelCharacter] {
        get {
            return self.arrResults ?? [MarvelCharacter]()
        }
        set {
            self.arrResults = newValue
        }
    }
    
}
