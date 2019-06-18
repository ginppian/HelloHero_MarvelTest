//
//  ReadJson.swift
//  HelloHero
//
//  Created by Memo on 6/18/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation

public class ReadJson: NSObject {
    
    
    public class func from(file: String) -> MarvelCharacterService {
        
        var menu = MarvelCharacterService()
        
        if let urlPath = Bundle.main.url(forResource: file, withExtension: "json") {
            
            do {
                let jsonData = try Data(contentsOf: urlPath, options: .mappedIfSafe)
                
                if let jsonRow = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? NSDictionary {
                    print(jsonRow)
                    menu = MarvelCharacterService(json: jsonRow)
                    print(menu)
                }
            }
                
            catch let jsonError {
                print(jsonError)
            }
        }
        return menu
    }
}
