//
//  DetailViewController.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/31.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 清除上一个视频的数据
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = "" 
        
        // 检查video不为nil
        guard video != nil else {
            return
        }
        
        // 创建一个URL
        let embedUrl = Constants.YT_EMBED_URL + video!.videoId
        let url = URL(string: embedUrl)
        
        // 将其加载到webView中
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // 设置title
        titleLabel.text = video!.title
        
        // 设置date
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        dateLabel.text = df.string(from: video!.published)
        
        // 设置描述
        textView.text = video!.description 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
