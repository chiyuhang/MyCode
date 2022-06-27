//
//  PickerCell.swift
//  0609ButtonDemo
//
//  Created by ByteDance on 2022/6/20.
//

import UIKit

class PickerCell: UITableViewCell {
    
    var viewData: PickerCellData? {
        didSet {
            guard let viewData = viewData else { return }
            nameLabel.text = viewData.name
            avatarView.image = viewData.avatarImage
            updateCheckBox(status: viewData.checkBoxStatus)
        }
    }
    
    // 头像，用Image代替
    private let avatarView = UIImageView()
    private let nameLabel = UILabel()
    private let checkBox = CheckBox(boxType: .single)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Cell 布局
        selectedBackgroundView = UIView()
        
        contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        // chechBox
        contentView.addSubview(checkBox)
        // 让checkbox不相应tap等事件，这也点击事件就会被tableView捕捉
        checkBox.isUserInteractionEnabled = false
        checkBox.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        // 头像
        contentView.addSubview(avatarView)
        avatarView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.left.equalTo(checkBox.snp.right).offset(12)
            make.centerY.equalToSuperview()
        }
        
        // 姓名
        nameLabel.textColor = UIColor(red: 0.121569, green: 0.137255, blue: 0.160784, alpha: 1)
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(avatarView.snp.right).offset(12)
            make.height.equalTo(24)
        }
        
        // 分割线
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = UIColor(red: 0.121569, green: 0.137255, blue: 0.160784, alpha: 0.15)
        contentView.addSubview(bottomLineView)
        bottomLineView.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.right.bottom.equalToSuperview()
            make.height.equalTo(CGFloat(1.0 / UIScreen.main.scale))
        }
        
    }
    
    private func updateCheckBox(status: CheckBoxStaus) {
        switch status {
        case .invalid:
            checkBox.isHidden = true
        case .selected:
            checkBox.isHidden = false
            updateCheckBox(selected: true, enabled: true)
        case .unselected:
            checkBox.isHidden = false
            updateCheckBox(selected: false, enabled: true)
        case .defaultSelected:
            checkBox.isHidden = false
            updateCheckBox(selected: true, enabled: false)
        case .disableToSelect:
            checkBox.isHidden = false
            updateCheckBox(selected: false, enabled: false)
        }
    }
    
    private func updateCheckBox(selected: Bool, enabled: Bool) {
       selectionStyle = enabled ? .default : .none
       checkBox.isEnabled = enabled
       checkBox.isSelected = selected
    }
    
}

class SectionHeader: UITableViewCell {
    
    let titleLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 0.94902, green: 0.952941, blue: 0.960784, alpha: 1)
        
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = UIColor(red: 0.121569, green: 0.137255, blue: 0.160784, alpha: 1)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct PickerCellData {
    var avatarImage: UIImage?
    var name: String
    var checkBoxStatus: CheckBoxStaus
}


enum CheckBoxStaus {
   case invalid, selected, unselected, defaultSelected, disableToSelect
}
