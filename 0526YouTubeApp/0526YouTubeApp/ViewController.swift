//
//  ViewController.swift
//  0526YouTubeApp
//
//  Created by ByteDance on 2022/5/26.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

