//
//  Constant.swift
//  BryjApp
//
//  Created by Piyush Mandaliya on 2022-06-02.
//

import Foundation
import UIKit

enum Image {
    static let account  = UIImage(named: "account_bay")
    static let bag      = UIImage(named: "bag_bay")
    static let home     = UIImage(named: "home_bay")
    static let header   = UIImage(named: "logo_for_header")
    static let shop     = UIImage(named: "shop_bay")
    static let menu     = UIImage(named: "AppIcons")
}

enum WebURL {
    static let home     = "https://www.thebay.com"
    static let shop     = "https://www.thebay.com/c/men"
    static let account  = "https://www.thebay.com/account/login"
    static let bag      = "https://www.thebay.com/cart"
}

enum PageTitle: String {
    case Home       = "Home"
    case Account    = "Account"
    case Shop       = "Shop"
    case bag        = "Bag"
}
