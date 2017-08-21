//
//  JsonToAlbum.swift
//  BachelorProefAppSwift
//
//  Created by Toon De True on 21/08/2017.
//  Copyright © 2017 Toon De True. All rights reserved.
//

import Foundation
import SwiftyJSON

final class JsonToAlbum{
    private var jsonObj : JSON?
    private init(){}
    
    static let shared = JsonToAlbum()
    
    public func getAlbums()->[Album]{
        if let path = Bundle.main.path(forResource : "Albums", ofType:"json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                self.jsonObj = JSON(data:data)
                if jsonObj == JSON.null{
                    print("Geenvalid json gevonden")
                } else {
                   return fillAlbums()
                }
            }catch let error{
                    print(error.localizedDescription)
                }
            } else {
                print("invalid filename/path")
            }
        
     return [Album]()
    }

private func fillAlbums()->[Album]{
    var albumsArr : [Album]?
     albumsArr = [Album]()
    for item in (jsonObj?["Albums"].arrayValue)!{
        let albumID = item["albumId"].intValue
        let iD = item["id"].intValue
        let title = item["title"].stringValue
        let url = item["url"].stringValue
        let artist = item["artist"].stringValue
        
        albumsArr?.append(Album(albumID: albumID, iD: iD, title: title, url: url, artist: artist))
    }
    
    return albumsArr!;
}
}


