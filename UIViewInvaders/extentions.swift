//
//  extentions.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 19/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension NSObject {
    func copyObject<T:NSObject>() throws -> T? {
        if #available(iOS 11.0, *) {
            let data = try NSKeyedArchiver.archivedData(withRootObject:self, requiringSecureCoding:false)
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T

        } else {
            return (NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T)
            // Fallback on earlier versions
        }
    }
}

extension UIView
{
    func clearSubviews()
    {
        for subview in self.subviews {
            subview.removeFromSuperview();
        }
    }
}
