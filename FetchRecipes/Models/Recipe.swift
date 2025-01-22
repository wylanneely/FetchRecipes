//
//  Recipe.swift
//  FetchRecipes
//
//  Created by Wylan L Neely on 1/15/25.
//


import Foundation

struct Recipe: Identifiable {
    
    let cuisine: String
    let name : String
    let id : String //UUID
    let photoUrlLarge : URL?
    let photoUrlSmall : URL?
    let sourceUrl : URL?
    let youtubeUrl : URL?
    
    init?(jsonData:[String:Any]){
        guard let cuisine = jsonData["cuisine"] as? String,
              let name = jsonData["name"] as? String,
              let uuid = jsonData["uuid"] as? String else {
            //required data
            return nil
       }
        self.cuisine = cuisine
        self.name = name
        self.id = uuid
        
        self.photoUrlLarge = (jsonData["photo_url_large"] as? String).flatMap(URL.init)
        self.photoUrlSmall = (jsonData["photo_url_small"] as? String).flatMap(URL.init)
        self.sourceUrl = (jsonData["source_url"] as? String).flatMap(URL.init)
        self.youtubeUrl = (jsonData["youtube_url"] as? String).flatMap(URL.init)
    }
}

extension Recipe {
    //made for testing
    init(
        cuisine: String,
        name:String,
        id:String,
        photoUrlLarge:URL?,
        photoURLSmall:URL?,
        sourceUrl:URL?,
        youtubeUrl:URL?
    ){
        self.cuisine = cuisine
        self.name = name
        self.id = id
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoURLSmall
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
    }
}
