////
////  PickerTableViewController.swift
////  0609ButtonDemo
////
////  Created by ByteDance on 2022/6/20.
////
//
import UIKit

class PickerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    typealias Users = (UIImage, String, Bool)
    
    var dataSource: [[Users]] = [[
        Users(UIImage(named: "selectAll")!, "全选", false),
        Users(UIImage(named: "headImage1")!, "张三", false),
        Users(UIImage(named: "headImage2")!, "李四", false),
        Users(UIImage(named: "headImage3")!, "王五", false),
        Users(UIImage(named: "headImage4")!, "赵六", false)
    ],[
        Users(UIImage(named: "selectAll")!, "全选", false),
        Users(UIImage(named: "headImage5")!, "周三", false),
        Users(UIImage(named: "headImage4")!, "小明", false),
        Users(UIImage(named: "headImage3")!, "小红", false),
        Users(UIImage(named: "headImage2")!, "小王", false),
        Users(UIImage(named: "headImage1")!, "大王", false),
        Users(UIImage(named: "headImage4")!, "老王", false),
        Users(UIImage(named: "headImage1")!, "张三", false),
        Users(UIImage(named: "headImage2")!, "李四", false),
        Users(UIImage(named: "headImage3")!, "王五", false),
        Users(UIImage(named: "headImage4")!, "赵六", false)
    ]]

//    private lazy var titleLabel = UILabel()
    private lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        // 注册cell
        tableView.register(PickerCell.self, forCellReuseIdentifier: "PickerCell")

        setComponents()
        setConstraints()
        setApperance()
    }

    func setComponents() {
        
        view.addSubview(tableView)
    }

    func setConstraints() {

        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.size.equalToSuperview()
        }

    }

    func setApperance() {
        self.title = "PickerDemo"
        view.backgroundColor = .white
        tableView.separatorStyle = .none
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as! PickerCell
        let checkBoxStatus = dataSource[indexPath.section][indexPath.row].2 == true ? CheckBoxStaus.selected : CheckBoxStaus.unselected
        cell.viewData = PickerCellData(avatarImage: dataSource[indexPath.section][indexPath.row].0, name: dataSource[indexPath.section][indexPath.row].1, checkBoxStatus: checkBoxStatus
        )
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeader()
        if section == 0 {
            header.textLabel?.text = "可能想添加的人"
        } else {
            header.textLabel?.text = "群内会话成员"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if !dataSource[indexPath.section][indexPath.row].2 {
                // 全选
                for i in 0..<dataSource[indexPath.section].count {
                    dataSource[indexPath.section][i].2 = true
                }
            } else {
                // 取消全选
                for i in 0..<dataSource[indexPath.section].count {
                    dataSource[indexPath.section][i].2 = false
                }
            }
            tableView.reloadData()
            return
        }
        dataSource[indexPath.section][indexPath.row].2 = !dataSource[indexPath.section][indexPath.row].2
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }


}
