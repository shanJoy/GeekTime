//
//  UIColorExtension.swift
//  GeekTime
//
//  Created by 张圣俊 on 2020/8/23.
//  Copyright © 2020 张圣俊. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func hexColor(_ hexValue: Int, alphaValue: Float) -> UIColor {
        return UIColor(red: CGFloat(hexValue & 0xFF0000 >> 16) / 255, green: CGFloat(hexValue & 0x00FF00 >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    static func hexColor(_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, alphaValue: 1)
    }
    
    convenience init(_ hexValue: Int, alphaValue: Float) {
        self.init(red: CGFloat(hexValue & 0xFF0000 >> 16) / 255, green: CGFloat(hexValue & 0x00FF00 >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    convenience init(_ hexValue: Int) {
        self.init(hexValue, alphaValue: 1)
    }
    
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
