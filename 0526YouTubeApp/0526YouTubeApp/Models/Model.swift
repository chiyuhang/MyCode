//
//  Model.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/27.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?

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
            
            do {
                
                // 将返回的数据解析道video对象中
                let decoder = JSONDecoder()
                // 设置日期解析格式
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data! )
                
                if response.items != nil {
                    // 调用 videosFetched，把数据传给tableview
                    DispatchQueue.main.sync {
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                                
                dump(response)
            }
            catch {
                
            }

        }
        
        // kick off task
        dataTask.resume()
    }
}
