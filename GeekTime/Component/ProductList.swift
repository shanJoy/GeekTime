//
//  ProductList.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/25.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ProductCell: CommonListCell<Product> {
    
    let priceLabel: UILabel
    let productImageView: UIImageView
    
    override var item: Product? {
        didSet {
            if let p = self.item {
                self.productImageView.kf.setImage(with: URL(string: p.imageUrl))
                self.textLabel?.text = p.name
                self.detailTextLabel?.text = p.desc
                self.priceLabel.text = "¥\(p.price)"
            }
        }
    }
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        priceLabel = UILabel(frame: .zero)
        productImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    private func setupViews() {
        textLabel?.textColor = UIColor.hexColor(0x333333)
        detailTextLabel?.textColor = UIColor.hexColor(0x999999)
        detailTextLabel?.numberOfLines = 2
        priceLabel.textColor = UIColor.hexColor(0xe23b41)
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        
        contentView.addSubview(priceLabel)
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
        
        priceLabel.snp.makeConstraints { (make) in
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


/*
 使用 CommonList中的 delegate， 这个也不需要了
 */
//protocol ProductListDelegate: AnyObject {
//    func didSelectProduct(product: Product)
//}

/*
 使用了 CommonList 替换 ProductList
 */
//class ProductList: UIView, UITableViewDataSource, UITableViewDelegate {
//
//    var tableView: UITableView
//    var items: [Product]! = [] {
//        didSet {
//            self.tableView.reloadData()
//        }
//    }
//
//    weak var delegate: ProductListDelegate?
//
//    override init(frame: CGRect) {
//        tableView = UITableView(frame: .zero, style: .plain)
//        super.init(frame: frame)
//        self.setupViews()
//    }
//
//    func setupViews() {
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.tableFooterView = UIView()
//        self.addSubview(tableView)
//        tableView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         return items.count
//     }
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         var cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as? ProductCell
//         if cell == nil {
//            cell = ProductCell(style: .subtitle, reuseIdentifier: "cellId")
//         }
//         cell?.item = items[indexPath.row]
//         return cell!
//     }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.didSelectProduct(product: items[indexPath.row])
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
