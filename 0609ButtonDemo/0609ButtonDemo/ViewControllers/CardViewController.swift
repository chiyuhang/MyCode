//
//  CardDemo.swift
//  0609ButtonDemo
//
//  Created by ByteDance on 2022/6/12.
//

import UIKit

class CardViewController: UIViewController {
    
    private lazy var countLabel: UILabel = createLabel("翻转次数：0")
    private lazy var buttons: [UIButton] = createButtons()
    
    var flipCount = 0 {
        didSet {
            countLabel.text = "翻转次数：\(flipCount)"
        }
    }
    
    let config: [Int: String] = [
        0: "👻",
        1: "🎃",
        2: "👻",
        3: "🎃"
    ]
    
    func createButtons() -> [UIButton] {
        var buttons: [UIButton] = []
        for i in 0...3 {
            buttons.append(createButton(config[i]!))
        }
        return buttons
    }
    
    func createButton(_ emoji: String) -> UIButton {
        let button = UIButton()
        button.setTitle(emoji, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        return button
    }
    
    func createLabel(_ emoji: String) -> UILabel {
        let label = UILabel()
        label.text = emoji
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 30)
        return label
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setComponents()
        setConstraints()
        setApperance()
         
    }
    
}

extension CardViewController {
    
    @objc
    func flipCard(_ button: UIButton) {
        flipCount += 1
        let buttonIndex = buttons.firstIndex(of: button)!
        let emoji = config[buttonIndex]
        if button.currentTitle == emoji {
            setDefault(button)
        }else {
            setSpecific(emoji!, button)
        }
    }
    
    func setDefault(_ button: UIButton) {
        button.setTitle("", for: .normal)
        button.backgroundColor = .systemOrange
    }
    
    func setSpecific(_ emoji: String, _ button: UIButton) {
        button.setTitle(emoji, for: .normal)
        button.backgroundColor = .white
    }
        
}

extension CardViewController {
    
    func setComponents() {
        for button in buttons {
            view.addSubview(button)
        }
        view.addSubview(countLabel)
    }
    
    func setConstraints() {
        
        for button in buttons {
            button.snp.makeConstraints { make in
                make.width.equalTo(120)
                make.height.equalTo(160)
            }
        }
        
        buttons[0].snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        buttons[1].snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        buttons[2].snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.top.equalTo(buttons[0].snp.bottom).offset(100)
        }
        
        buttons[3].snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.top.equalTo(buttons[0].snp.bottom).offset(100)
        }
        
        countLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
    }
    
    func setApperance() {
        for button in buttons {
            button.addTarget(self, action: #selector(flipCard(_:)), for: .touchUpInside)
        }
    }
}
