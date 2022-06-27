//
//  MyCheck.swift
//  0609ButtonDemo
//
//  Created by ByteDance on 2022/6/20.
//

import Foundation
import UIKit
import SnapKit

// 单选还是多选类型
public enum CheckBoxType {
    case single
    case multiple
}

// 用到的颜色，从UD组件里提取的
public struct CheckBoxColorConfig {
    public static var borderEnabledColor = UIColor(red: 0.560784, green: 0.584314, blue: 0.619608, alpha: 1)
    public static var borderDisabledColor = UIColor(red: 0.733333, green: 0.74902, blue: 0.768627, alpha: 1)
    public static var selectedBackgroundDisableColor = UIColor(red: 0.733333, green: 0.74902, blue: 0.768627, alpha: 1)
    public static var unselectedBackgroundDisableColor = UIColor(red: 0.937255, green: 0.941176, blue: 0.945098, alpha: 1)
    public static var selectedBackgroundEnabledColor = UIColor(red: 0.2, green: 0.439216, blue: 1, alpha: 1)
    public static var unselectedBackgroundEnabledColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
}

// 定义各种状态的颜色
public struct CheckBoxUIConfig {

    /// Checkbox Unselected Border Enabled Color
    public var borderEnabledColor: UIColor = CheckBoxColorConfig.borderEnabledColor

    /// Checkbox Unselected Border Disabled Color
    public var borderDisabledColor: UIColor = CheckBoxColorConfig.borderDisabledColor

    /// Checkbox Selected Background Disabled Color
    public var selectedBackgroundDisableColor: UIColor = CheckBoxColorConfig.selectedBackgroundDisableColor

    /// Checkbox Unselected Background Disabled Color
    public var unselectedBackgroundDisableColor: UIColor = CheckBoxColorConfig.unselectedBackgroundDisableColor

    /// Checkbox Unselected Background Enabled Color
    public var unselectedBackgroundEnabledColor: UIColor = CheckBoxColorConfig.unselectedBackgroundEnabledColor

    /// Checkbox Selected Background Enabled Color
    public var selectedBackgroundEnabledColor: UIColor = CheckBoxColorConfig.selectedBackgroundEnabledColor

    public init() {}
    
}

public class CheckBox: UIControl {
    
    public private(set) var boxType: CheckBoxType
    public private(set) var config: CheckBoxUIConfig
    private var centerIconView: UIImageView = UIImageView()
    private var wrapperView: UIView = UIView()
    
    public override var isSelected: Bool {
        didSet {
            self.updateUI()
        }
    }
    
    public init(boxType: CheckBoxType = .single,
                config: CheckBoxUIConfig = CheckBoxUIConfig()) {
        self.boxType = boxType
        self.config = config
        super.init(frame: .zero)
        self.commonInit(boxType: boxType, config: config)
    }
    
    private func commonInit(boxType: CheckBoxType,
                             config: CheckBoxUIConfig) {
        // 设置clear，防止遮挡其它视图
        self.backgroundColor = UIColor.clear
        self.addSubview(wrapperView)
        
        self.wrapperView.addSubview(centerIconView)
        self.wrapperView.layer.borderColor = UIColor.clear.cgColor
        self.wrapperView.layer.borderWidth = 1.5
        self.centerIconView.image = UIImage(named: "selected")
        
        wrapperView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        switch boxType {
            // 一会儿看下效果，多选和单选布局有什么不同
        case .single:
            centerIconView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        case .multiple:
            centerIconView.snp.remakeConstraints { (make) in
                make.center.equalToSuperview()
                make.width.height.equalToSuperview().multipliedBy(0.6)
            }
        }
        // 设置圆角
        self.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // checkBox设置成圆角
    public override func layoutSubviews() {
        super.layoutSubviews()
        let minLength = min(bounds.width, bounds.height)
        // 将wrapperView圆角半径设置成长和高最小值的一半
        wrapperView.layer.cornerRadius = minLength / 2
    }
    
    public func updateUI(){
        
        // 如果没有选中，就隐藏中心的选中图片
        centerIconView.isHidden = !self.isSelected

        if isEnabled {
            if isSelected {
                wrapperView.backgroundColor = config.selectedBackgroundEnabledColor
                wrapperView.layer.borderColor = UIColor.clear.cgColor
            } else {
                wrapperView.backgroundColor = config.unselectedBackgroundEnabledColor
                wrapperView.layer.borderColor = config.borderEnabledColor.cgColor
            }
        } else {
            if isSelected {
                wrapperView.backgroundColor = config.selectedBackgroundDisableColor
                wrapperView.layer.borderColor = UIColor.clear.cgColor
            } else {
                wrapperView.backgroundColor = config.unselectedBackgroundDisableColor
                wrapperView.layer.borderColor = config.borderDisabledColor.cgColor
            }
        }
    }
    
}


