//
//  ConversionViewController.swift
//  0606WorldTrotter
//
//  Created by ByteDance on 2022/6/5.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad方法被调用")
    }
    
    var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var celsiusValue: Double? {
        if let value = fahrenHeitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    // 属性观察者(propery observer)，可在属性改变时调用闭包内的代码
    var fahrenHeitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    // 更新摄氏度的值，并将值赋值给摄氏度Label展示
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: value))
        }else {
            celsiusLabel.text = "???"
        }
    }
    
    // 当用户点击背景时，隐藏键盘
    @IBAction func dismissKeyBoard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    // 每次输入框发生变化，调用这个函数，尝试更新华氏温度的值
    @IBAction func fahrenHeitFieldEditingChanged(textField: UITextField) {
        // 首先检查UITextView是否有文字，如果有，检查文字是否能转化为Double
        if let text = textField.text, let value = Double(text) {
            fahrenHeitValue = value
        } else {
            fahrenHeitValue = nil
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator =  textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            // 已经有了小数点，还要再写一个小数点，直接拒绝
            return false
        }
        return true
    }
}
