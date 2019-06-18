//
//  MarvelCharacterService.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelCharacterService: NSObject {
    
    fileprivate var code: Int?
    fileprivate var status: String?
    fileprivate var copyright: String?
    fileprivate var attributionText: String?
    fileprivate var attributionHTML: String?
    fileprivate var etag: String?
    fileprivate var data: MarvelCharacterData?
    
    init(_ code: Int,
         _ status: String,
         _ copyright: String,
         _ attributionText: String,
         _ attributionHTML: String,
         _ etag: String,
         _ data: MarvelCharacterData) {
        
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.etag = etag
        self.data = data
    }
    
    convenience public init(json: NSDictionary) {
        let code = json["code"] as? Int ?? Int()
        let status = json["status"] as? String ?? String()
        let copyright = json["copyright"] as? String ?? String()
        let attributionText = json["attributionText"] as? String ?? String()
        let attributionHTML = json["attributionHTML"] as? String ?? String()
        let etag = json["etag"] as? String ?? String()
        
        let dataRow = json["data"] as? NSDictionary ?? NSDictionary()
        let data = MarvelCharacterData(json: dataRow)
        
        self.init(code, status, copyright, attributionText, attributionHTML, etag, data)
    }
    
    
    override public init() {
        super.init()
        
        self.code = Int()
        self.status = String()
        self.copyright = String()
        self.attributionText = String()
        self.attributionHTML = String()
        self.etag = String()
        self.data = MarvelCharacterData()
    }
    public var Code: Int {
        get {
            return self.code ?? Int()
        }
        set {
            self.code = newValue
        }
    }
    
    public var Status: String {
        get {
            return self.status ?? String()
        }
        set {
            self.status = newValue
        }
    }
    
    public var Copyright: String {
        get {
            return self.copyright ?? String()
        }
        set {
            self.copyright = newValue
        }
    }
    
    public var AttributionText: String {
        get {
            return self.attributionText ?? String()
        }
        set {
            self.attributionText = newValue
        }
    }
    
    public var AttributionHTML: String {
        get {
            return attributionHTML ?? String()
        }
        set {
            self.attributionHTML = newValue
        }
    }
    
    public var Etag: String {
        get {
            return self.etag ?? String()
        }
        set {
            self.etag = newValue
        }
    }
    
    public var Data: MarvelCharacterData {
        get {
            return self.data ?? MarvelCharacterData()
        }
        set {
            self.data = newValue
        }
    }
}
