//
//  ViewController.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
     
    var model = Model()
    // 初始化一个video空数组
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getVideos()
        
    }
    
    // 当用户点击视频缩略图，发生segue(切换)时会调用这个函数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 判断用户真的点击了一个视频
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // 获取video的引用
        let selectedVideo = videos[tableView!.indexPathForSelectedRow!.row]

        // 获取DetailViewController 的引用
        let detailVC = segue.destination as! DetailViewController
        
        // 将video赋值给DetailViewController
        detailVC.video = selectedVideo
        
    }
    
    // Mark: Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        // 将返回值给videos变量
        self.videos = videos
         
        // 刷新tableview
        self.tableView.reloadData()
        
    }
    
    
    // Mark: TableView Methods
    
    /**
        返回表格数据有多少行
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    /**
         每行数据如何显示
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 新建一个cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        let video = videos[indexPath.row]
        
        cell.setCell(video)

        return cell 
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
    }


}

