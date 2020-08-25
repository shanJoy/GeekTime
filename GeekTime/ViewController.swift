//
//  ViewController.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/23.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.image = R.image.home()
        homeVC.tabBarItem.selectedImage = R.image.home_selected()?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.hexColor(0x333333)], for: .selected)
        homeVC.tabBarItem.title = "首页"
        let navgationHomeVC = UINavigationController(rootViewController: homeVC)
        self.addChild(navgationHomeVC)
        
        let mineVC = MineViewController()
        mineVC.tabBarItem.image = R.image.mine()
        mineVC.tabBarItem.selectedImage = R.image.mine_selected()?.withRenderingMode(.alwaysOriginal)
        mineVC.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.hexColor(0x333333)], for: .selected)
        mineVC.tabBarItem.title = "我的"
        let navgationMineVC = UINavigationController(rootViewController: mineVC)
        self.addChild(navgationMineVC)
        
        
        
    }
    
}

