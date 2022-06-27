//
//  ItemCell.swift
//  0609ButtonDemo
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class ItemCell: UITableViewCell {
    
    typealias ListItem = (String, UIImage, () -> UIViewController)
    
    // 将内容添加到contentView中
    
    var title: String = "Demo" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private lazy var titleLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        var textField = UITextField()
        textField.beginningOfDocument
        
    }
    
}
