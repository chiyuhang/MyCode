//
//  CacheManager.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/31.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data) {
        
        // 存储video
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        return cache[url]
    }
    
}
