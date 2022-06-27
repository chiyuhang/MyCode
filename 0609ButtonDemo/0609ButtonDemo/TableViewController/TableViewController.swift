//
//  TableViewController.swift
//  0609ButtonDemo
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    typealias ListItem = (String, () -> UIViewController)
    
    var dataSource: [ListItem] = [
        ListItem("Button", { ButtonViewController() }),
        ListItem("Question", { QuizViewController() }),
        ListItem("Map", { MapViewController() }),
        ListItem("Card", { CardViewController() }),
        ListItem("PickerSectionDemo", { PickerTableViewController() })
    ]
    
    private lazy var titleLabel = UILabel()
    private lazy var tableView = UITableView()
    
    var item = ["Button", "Q & A", "Map"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableViewController loaded its view")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //注册cell
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        setComponents()
        setConstraints()
        setApperance()
    }
    
    func setComponents() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
    }
    
    func setApperance() {
        view.backgroundColor = .white
        titleLabel.backgroundColor = .white
        titleLabel.text = "应用导航"
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // 每一个cell显示的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.title = dataSource[indexPath.row].0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("第\(indexPath.row)被点击了")
        let vc = dataSource[indexPath.row].1
        self.navigationController?.pushViewController(vc(), animated: true)
    }
    
    
}
