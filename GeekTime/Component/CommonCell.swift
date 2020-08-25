//
//  CommonCell.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/26.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CommonCell: UIControl {
    
    var title: String? {
        didSet {
            self.titleView.text = self.title
        }
    }
    
    var icon: UIImage? {
        didSet {
            self.iconView.image = self.icon
        }
    }
    
    var titleView: UILabel
    var iconView: UIImageView
    var bottomLine: UIView
    var arrowView: UIImageView
    
    var helightView: UIView
    
    override init(frame: CGRect) {
        titleView = UILabel()
        iconView = UIImageView()
        bottomLine = UIView()
        arrowView = UIImageView(image: R.image.icon_right_arrow())
        helightView = UIView()
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupViews()
    }
    
    func setupViews() {
        
        self.addSubview(helightView)
        helightView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        helightView.isHidden = true
        helightView.alpha = 0
        helightView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(32)
        }
        
        self.addSubview(titleView)
        titleView.textColor = UIColor.hexColor(0x333333)
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp_right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(arrowView)
        arrowView.snp.makeConstraints { (m) in
            m.right.equalToSuperview().offset(-20)
            m.centerY.equalToSuperview()
        }
        
        self.addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor(white: 0.9, alpha: 1)
        bottomLine.snp.makeConstraints { (m) in
            m.bottom.equalToSuperview()
            m.left.right.equalToSuperview()
            m.height.equalTo(1 / UIScreen.main.scale)
        }
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.helightView.alpha = 1
                self.helightView.isHidden = false
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.helightView.alpha = 0
                }) { (finished) in
                    self.helightView.isHidden = true
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
