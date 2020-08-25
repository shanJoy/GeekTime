//
//  DetailViewController.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/25.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    var product: Product!
    var avatarView: UIImageView!
    var nameLabel: UILabel!
    var descLabel: UILabel!
    var teacherLabel: UILabel!
    var courseCountLabel: UILabel!
    var studentCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情"
        createTop()
        createMiddle()
        createBottom()
    }
    
    func createTop() {
        
    }
    
    func createMiddle() {
        
    }
    
    func createBottom() {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("购买 ¥\(product.price)", for: .normal)
        button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        button.addTarget(self, action: #selector(didClickBuyButton), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            
        }
    }

}
