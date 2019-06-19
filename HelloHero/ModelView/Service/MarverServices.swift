//
//  MarverServices_CharactersList.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class MarvelServices: NSObject {
    
    public class func characterList(_ offset: Int, _ limit: Int, completion: @escaping (_ completion: MarvelCharacterData?) -> Void) { 
        
        let request = DGRequest()
        
        let ts = "thesoer"
        let apikey = "001ac6c73378bbfff488a36141458af2"
        let hash = "72e5ed53d1398abb831c3ceec263f18b"
        
        let urlStr = "https://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(apikey)&hash=\(hash)&offset=\(offset)&limit=\(limit)"
        print("urlStr: \(urlStr)")
        
        request.httpGet(url: urlStr) { (requestorError, requestorJson) in
            if let jsonRow = requestorJson {
                let marvelService = MarvelCharacterService(json: jsonRow)
                completion(marvelService.Data)
            } else {
                print(requestorError)
                completion(nil)
            }
        }
    }
}
