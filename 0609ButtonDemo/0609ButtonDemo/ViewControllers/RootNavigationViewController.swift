//
//  RootNavigationViewController.swift
//  0609ButtonDemo
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class RootNavigationViewController: UINavigationController, UINavigationControllerDelegate {
    
    // 在viewController的视图创建后调用
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        self.delegate = self
        
        // UINavigationCroller维护了一个UIViewController数组
        // 数组保存在一个栈中，显示在屏幕上的是位于栈顶顶UIViewController的视图
        // UDCRootTabBarController 是 UINavigationController 的根视图控制器
        self.viewControllers = [TableViewController()]
        
    }
    
}
