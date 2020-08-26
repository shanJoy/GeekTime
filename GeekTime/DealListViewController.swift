//
//  DealListViewController.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/26.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import UIKit

class DealListViewController: BaseViewController, CommonListDelegate {
    
    func didSelectItem<Item>(_ item: Item) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let dealList = CommonList<Deal, DealListCell>(frame: .zero)
        dealList.items = FakeData.createDeals()
        dealList.delegate = self
        view.addSubview(dealList)
        dealList.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
