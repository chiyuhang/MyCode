//
//  ViewController.swift
//  0606Quiz
//
//  Created by ByteDance on 2022/6/5.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["爸爸的爸爸叫什么？",
                                "妈妈的妈妈叫什么？",
                                "妈妈的姊妹叫什么"]
    let answers: [String] = ["爸爸的爸爸叫爷爷",
                             "妈妈的妈妈叫外婆",
                             "妈妈的姐妹叫姨妈"]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
}

