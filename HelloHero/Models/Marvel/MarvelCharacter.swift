//
//  Character.swift
//  HelloHero
//
//  Created by Memo on 6/17/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelCharacter: NSObject {
    
    fileprivate var id: Int?
    fileprivate var name: String?
    fileprivate var _description: String?
    fileprivate var modified: String?
    fileprivate var resourceURI: String?
    
    fileprivate var thumbnail: MarvelThumbnail?
    fileprivate var comics: MarvelComic?
    fileprivate var series: MarvelSerie?
    fileprivate var stories: MarvelStorie?
    fileprivate var events: MarvelEvent?
    fileprivate var urls: [MarvelURL]?
    
    init(_ id: Int,
         _ name: String,
         _ _description: String,
         _ modified: String,
         _ resourceURI: String,
         _ thumbnail: MarvelThumbnail,
         _ comics: MarvelComic,
         _ series: MarvelSerie,
         _ stories: MarvelStorie,
         _ events: MarvelEvent,
         _ urls: [MarvelURL]) {
        
        self.id = id
        self.name = name
        self._description = _description
        self.modified = modified
        self.resourceURI = resourceURI
        self.thumbnail = thumbnail
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
        self.urls = urls
    }
    
    convenience public init(json: NSDictionary) {
        
        let id = json["id"] as? Int ?? Int()
        let name = json["name"] as? String ?? String()
        let _description = json["description"] as? String ?? String()
        let modified = json["modified"] as? String ?? String()
        let resourceURI = json["resourceURI"] as? String ?? String()
        
        let thumbnailRow = json["thumbnail"] as? NSDictionary ?? NSDictionary()
        let thumbnail = MarvelThumbnail(json: thumbnailRow)
        
        let comicRow = json["comics"] as? NSDictionary ?? NSDictionary()
        let comic = MarvelComic(json: comicRow)
        
        let serieRow = json["series"] as? NSDictionary ?? NSDictionary()
        let serie = MarvelSerie(json: serieRow)
        
        let storieRow = json["stories"] as? NSDictionary ?? NSDictionary()
        let storie = MarvelStorie(json: storieRow)
        
        let eventRow = json["events"] as? NSDictionary ?? NSDictionary()
        let event = MarvelEvent(json: eventRow)
        
        let urlsRow = json["urls"] as? [NSDictionary] ?? [NSDictionary]()
        var urls = [MarvelURL]()
        for urlRow in urlsRow {
            let url = MarvelURL(json: urlRow)
            urls.append(url)
        }
        
        self.init(id, name, _description, modified, resourceURI, thumbnail, comic, serie, storie, event, urls)
    }
    
    override public init() {
        super.init()
        
        self.id = Int()
        self.name = String()
        self._description = String()
        self.modified = String()
        self.resourceURI = String()
        self.thumbnail = MarvelThumbnail()
        self.comics = MarvelComic()
        self.series = MarvelSerie()
        self.stories = MarvelStorie()
        self.events = MarvelEvent()
        self.urls = [MarvelURL]()
    }
    
    public var ID: Int {
        get {
            return self.id ?? Int()
        }
        set {
            self.id = newValue
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
    
    public var Description: String {
        get {
            return self._description ?? String()
        }
        set {
            self._description = newValue
        }
    }
    
    public var Modified: String {
        get {
            return self.modified ?? String()
        }
        set {
            self.modified = newValue
        }
    }
    
    public var ResourceURI: String {
        get {
            return self.resourceURI ?? String()
        }
        set {
            self.resourceURI = newValue
        }
    }
    
    public var Thumbnail: MarvelThumbnail {
        get {
            return self.thumbnail ?? MarvelThumbnail()
        }
        set {
            self.thumbnail = newValue
        }
    }
    
    public var Comics: MarvelComic {
        get {
           return self.comics ?? MarvelComic()
        }
        set {
            self.comics = newValue
        }
    }
    
    public var Series: MarvelSerie {
        get {
            return self.series ?? MarvelSerie()
        }
        set {
            self.series = newValue
        }
    }
    
    public var Stories: MarvelStorie {
        get {
            return self.stories ?? MarvelStorie()
        }
        set {
            self.stories = newValue
        }
    }
    
    public var Events: MarvelEvent {
        get {
            return self.events ?? MarvelEvent()
        }
        set {
            self.events = newValue
        }
    }
    
    public var Urls: [MarvelURL] {
        get {
            return self.urls ?? [MarvelURL]()
        }
        set {
            self.urls = newValue
        }
    }
}
