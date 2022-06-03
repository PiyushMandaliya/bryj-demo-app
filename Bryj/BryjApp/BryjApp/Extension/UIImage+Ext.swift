//
//  UIImage+Ext.swift
//  BryjApp
//
//  Created by Piyush Mandaliya on 2022-06-02.
//

import UIKit

extension UIImage {
        
    func resizeImage(width: CGFloat, height: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0.0);

        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsEndImageContext()
        return image
    }
}
