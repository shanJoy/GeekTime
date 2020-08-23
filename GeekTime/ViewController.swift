//
//  ViewController.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/23.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        button.setTitle("click", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didClickBtn), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (m) in
            m.left.top.equalTo(100)
            m.width.equalTo(100)
            m.height.equalTo(50)
        }
    }

    @objc func didClickBtn() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

