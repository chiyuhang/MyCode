//
//  ViewController.swift
//  0534WarCardGame
//
//  Created by ByteDance on 2022/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func dealTapped(_ sender: Any) {
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber > rightNumber {
            // player win
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            
        }else if leftNumber < rightNumber {
            // computer win
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
        }else {
            //
        }
        
    }
    
}

