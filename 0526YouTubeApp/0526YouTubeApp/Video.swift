//
//  Video.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/27.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description = "description"
        case thumbnail = "url"
        case videoId
        
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // 解析title
        self.title = try snippetContainer.decode( String.self, forKey: .title)
        
        // 解析description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // 解析publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published )
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails )
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // 解析videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId) 
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
         
    }
    
}
