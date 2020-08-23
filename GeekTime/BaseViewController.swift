//
//  BaseViewController.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/23.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.hexColor(0xf2f4f7)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.hexColor(0x333333)]
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
