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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // 为这个cell配置数据
        let title = videos[indexPath.row].title
        
        cell.textLabel?.text = title
        // 把cell返回
        return cell 
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
    }


}

