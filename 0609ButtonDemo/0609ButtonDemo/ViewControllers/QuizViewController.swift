//
//  ViewController.swift
//  0606Quiz
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class QuizViewController: UIViewController {
    
    private lazy var questionLabel: UILabel = UILabel()
    private lazy var answerLabel: UILabel = UILabel()
    private lazy var nextButton: UIButton = createRoundButton("下一个问题")
    private lazy var showAnswerButton: UIButton = createRoundButton("显示答案")

    let questions: [String] = ["1 + 1 = ？", "2 + 2 = ？", "5 x 7 = ? "]
    let answers: [String] = ["2","4","35"]
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("QuizViewController loaded its view")
        view.backgroundColor = .white
        setComponents()
        setConstraints()
        setApperance()
    }
    
    func setComponents() {
        view.addSubview(questionLabel)
        view.addSubview(answerLabel)
        view.addSubview(nextButton)
        view.addSubview(showAnswerButton)
    }
    
    func setConstraints() {
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80)
            $0.top.equalTo(questionLabel.snp.bottom).offset(40)
        }
        
        answerLabel.snp.makeConstraints { make in
            make.top.equalTo(nextButton).offset(200)
            make.centerX.equalToSuperview()
        }
        
        showAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(answerLabel).offset(80)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func setApperance() {
        // 默认text
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
        
        // 设置字体
        questionLabel.font = UIFont.systemFont(ofSize: 25)
        answerLabel.font = UIFont.systemFont(ofSize: 25)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        showAnswerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        // 绑定点击事件
        nextButton.addTarget(self, action: #selector(showNextQuestion(_:)), for: .touchUpInside)
        showAnswerButton.addTarget(self, action: #selector(showAnswer(_:)), for: .touchUpInside)
    }
}

extension QuizViewController {
    
    @objc
    func showNextQuestion(_ button: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }

    @objc
    func showAnswer(_ button: UIButton) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func createRoundButton(_ color: String) -> UIButton {
        
        let button = UIButton()
        
        // 设置圆角
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        // 设置颜色和字体大小
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.setTitle(color, for: .normal)//设置文字
        
        return button
    }
}

