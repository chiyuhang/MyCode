//
//  VideoTableViewCell.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/30.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // 保证video不为空
        guard self.video != nil else {
            return
        }
        
        // 设置video的title和date
        self.titleLabel.text = video?.title
        
        // 设置日期
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        self.dateLabel.text = df.string(from: video!.published)
        
        // 设置缩略图（thumbnail）
        guard self.video!.thumbnail != "" else {
            return
        }
        
        if let cacheData =  CacheManager.getVideoCache(self.video!.thumbnail) {
            // 图片已经缓存，设置imageView
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }

        
        // 下载URL数据
        let url = URL(string: self.video!.thumbnail)
        
                
        // 获取shared URL Session 对象
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                // 将data保存之cache
                CacheManager.setVideoCache(self.video!.thumbnail, data!)
                
                if url?.absoluteString != self.video?.thumbnail {
                    // 当数据下载完成时，这个video cell已经被回收了（因为用户滚动了页面）
                    // 就是说这个数据还没下载完成时，用户已经在看其他视频了，那么旧的数据不应该展示
                    return;
                }
                
                // 创建一个UIImage
                let image = UIImage(data: data!)
                
                // 设置imageView
                DispatchQueue.main.sync {
                    self.thumbnailImageView.image = image
                }
                
                
            }
        }
        
        // 开始数据任务
        dataTask.resume()
        
    }

}
