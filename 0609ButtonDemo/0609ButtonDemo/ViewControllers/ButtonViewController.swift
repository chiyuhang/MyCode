//
//  ButtonViewController.swift
//  0609ButtonDemo
//
//  Created by ByteDance on 2022/6/9.
//

import UIKit
import SnapKit

class ButtonViewController: UIViewController {

    let colorConfig: [Int: UIColor] = [
        0: UIColor.white,
        1: UIColor.systemRed,
        2: UIColor.systemGreen
    ]
    
    private lazy var buttonStyleLabel: UILabel = createTitleLabel("修改按钮样式: ")
    private lazy var buttonStyleStackView: UIStackView = createStackView()
    private lazy var styleButton: UIButton = createButton("按钮样式")
    private lazy var styleButton1: UIButton = createButton("按钮样式")
    
    private lazy var bgColorLabel: UILabel = createTitleLabel("修改背景颜色: ")
    private lazy var whiteColorButton: UIButton = createRoundButton("白色")
    private lazy var redColorButton: UIButton = createRoundButton("红色")
    private lazy var greenColorButton: UIButton = createRoundButton("绿色")
    private lazy var checkBox = CheckBox(boxType: .single)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ButtonViewController is created.")
        view.backgroundColor =  .white
        
        setComponents()
        setConstraints()
        setApperance()
        
        self.title = "Components"
        
    }
    
    func createTitleLabel(_ title: String) -> UILabel{
        let lable = UILabel()
        lable.text = title
        return lable
    }
    
    func createRoundButton(_ color: String) -> UIButton {
        
        let button = UIButton()
        
        // 设置圆角
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        // 设置颜色和字体大小
        button.backgroundColor = .systemBlue
        button.setTitleColor(.systemGray2, for: .highlighted)
        button.setTitleColor(.systemGray, for: .disabled)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.setTitle(color, for: .normal) // 设置文字
        
        return button
    }
    
    func createButton(_ color: String) -> UIButton {
         
        let button = UIButton()
        
        // 设置颜色和字体大小
        button.backgroundColor = .systemBlue
        button.setTitleColor(.systemGray2, for: .highlighted)
        button.setTitleColor(.systemGray2, for: .disabled)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.setTitle(color, for: .normal)//设置文字
        
        return button
    }
    
    // 添加view
    func setComponents(){
        
        whiteColorButton.tag = 0
        redColorButton.tag = 1
        greenColorButton.tag = 2
        
        view.addSubview(bgColorLabel)
        view.addSubview(whiteColorButton)
        view.addSubview(redColorButton)
        view.addSubview(greenColorButton)
        view.addSubview(buttonStyleLabel)
        view.addSubview(buttonStyleStackView)
        view.addSubview(styleButton)
        view.addSubview(styleButton1)
        view.addSubview(checkBox)
    }
    
    // 创建一个StackView，放入三个button
    func createStackView() -> UIStackView {
        
        let buttonText: [String] = ["默认", "禁用", "圆角"]
        var buttons: [UIButton] = []
        for text in buttonText {
            buttons.append(createRoundButton(text))
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        
        stackView.axis = NSLayoutConstraint.Axis.horizontal //内部横向排列方式
        stackView.spacing = 10  //设置每个视图间隔
        stackView.distribution = UIStackView.Distribution.fillEqually
        
        return stackView
    }
    
    // 设置约束（定位）
    func setConstraints(){
        
        bgColorLabel.snp.makeConstraints() { make in
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(20)
        }
        
        whiteColorButton.snp.makeConstraints() { make in
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.centerY.equalTo(bgColorLabel.snp.centerY)
            make.left.equalTo(bgColorLabel.snp.right).offset(10)
        }
        
        redColorButton.snp.makeConstraints() { make in
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.centerY.equalTo(bgColorLabel.snp.centerY)
            make.left.equalTo(whiteColorButton.snp.right).offset(10)
        }
        
        greenColorButton.snp.makeConstraints() { make in
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.centerY.equalTo(bgColorLabel.snp.centerY)
            make.left.equalTo(redColorButton.snp.right).offset(10)
        }
        
        buttonStyleLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.top.equalTo(bgColorLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        buttonStyleStackView.snp.makeConstraints() { make in
            make.height.equalTo(30)
            make.top.equalTo(bgColorLabel.snp.bottom).offset(20)
            make.left.equalTo(buttonStyleLabel.snp.right).offset(20)
            make.width.equalTo(200)
        }
        
        styleButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(buttonStyleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
        }
        
        styleButton1.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(styleButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
        }
        
        checkBox.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.top.equalTo(styleButton1.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
    }
    
    // 调整外观
    func setApperance(){
        
        whiteColorButton.addTarget(self, action: #selector(setBackgroundColor(_:)), for: .touchUpInside)
        redColorButton.addTarget(self, action: #selector(setBackgroundColor(_:)), for: .touchUpInside)
        greenColorButton.addTarget(self, action: #selector(setBackgroundColor(_:)), for: .touchUpInside)
        checkBox.isHidden = false
        checkBox.isEnabled = true
        checkBox.isSelected = false
        
        // 取出stackView中的三个button，分别绑定事件
        
        // 默认button
        let defalutButton = buttonStyleStackView.arrangedSubviews[0] as! UIButton
        defalutButton.tag = 0
        defalutButton.addTarget(self, action: #selector(setButtonStyle(_:)), for: .touchUpInside)
        
        // 禁用button
        let disabledButton = buttonStyleStackView.arrangedSubviews[1] as! UIButton
        disabledButton.tag = 1
        disabledButton.addTarget(self, action: #selector(setButtonStyle(_:)), for: .touchUpInside)
        
        // 圆角button
        let roundButton = buttonStyleStackView.arrangedSubviews[2] as! UIButton
        roundButton.tag = 2
        roundButton.addTarget(self, action: #selector(setButtonStyle(_:)), for: .touchUpInside)
        
        // 尝试一些button的样式
        // init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat)
        styleButton1.tintColor = .systemOrange
        
    }
    
    func tapCheckBox(check: CheckBox) {
        print("CheckBox 被点击了")
    }
    
}

// 与target绑定的action方法
extension ButtonViewController {
    
    @objc
    func setBackgroundColor(_ button: UIButton) {
        view.backgroundColor = colorConfig[button.tag]
    }
    
    @objc
    func setRedBackgroundColor(_ button: UIButton) {
        view.backgroundColor = .red
    }
    
    @objc
    func setButtonStyle(_ button: UIButton) {
        
        switch button.tag {
        case 0:
            styleButton.isEnabled = true
            styleButton.layer.cornerRadius = 0
            styleButton.layer.masksToBounds = false
            print("恢复默认样式")
        case 1:
            print("尝试禁用按钮")
            styleButton.isEnabled = false
        case 2:
            // 设置圆角
            styleButton.layer.cornerRadius = 5
            styleButton.layer.masksToBounds = true
        default:
            print("Button tag is not incorrect")
        }
    }
    
    
}
