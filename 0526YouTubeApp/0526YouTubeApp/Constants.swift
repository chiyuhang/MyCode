//
//  Constants.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/27.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLsHtPsJH4Yhg-udP9laJzg6-JNG72ttGB"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
