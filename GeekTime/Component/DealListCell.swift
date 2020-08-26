//
//  DealListCell.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/26.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DealListCell: CommonListCell<Deal> {
    
    let progressLabel: UILabel
    let productImageView: UIImageView
    
    override var item: Deal? {
        didSet {
            if let d = self.item {
                self.productImageView.kf.setImage(with: URL(string: d.product.imageUrl))
                self.textLabel?.text = d.product.name
                self.detailTextLabel?.text = d.product.desc
                self.progressLabel.text = "已经学习 \(d.progress)%"
            }
        }
    }
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        progressLabel = UILabel(frame: .zero)
        productImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    private func setupViews() {
        textLabel?.textColor = UIColor.hexColor(0x333333)
        detailTextLabel?.textColor = UIColor.hexColor(0x999999)
        detailTextLabel?.numberOfLines = 2
        progressLabel.textColor = UIColor.hexColor(0x999999 )
        progressLabel.font = UIFont.systemFont(ofSize: 15)
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        
        contentView.addSubview(progressLabel)
        contentView.addSubview(productImageView)
        
        productImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        
        textLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(productImageView.snp_right).offset(12)
            make.top.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
        
        progressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(textLabel!)
            make.centerY.equalTo(contentView)
        }
        
        detailTextLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(textLabel!)
            make.bottom.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

