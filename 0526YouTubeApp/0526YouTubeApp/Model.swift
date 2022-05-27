//
//  Model.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/27.
//

import Foundation

class Model {
    func getVideos() {
        
        // 创建一个URL对象
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // 获取一个URLSession对象
        let session = URLSession.shared
        
        // 从URLSession对象中获取data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // 检查是否返回了错误
            if error != nil || data == nil {
                return
            }
            
            // 将返回的数据解析道video对象中
            
        }
        
        // kick off task
        dataTask.resume()
    }
}
