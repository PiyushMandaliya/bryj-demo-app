//
//  TBTabBarController.swift
//  BryjApp
//
//  Created by Piyush Mandaliya on 2022-06-02.
//

import UIKit

class TBTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .black
        viewControllers          = [createHomeNavigationController(), creatShopNavigationController(),
                                    createAccountNavigationController(), createBagNavigationController()]
    }
    
    func createHomeNavigationController() -> UINavigationController {
        let homeVC              = TBMainVC(pageType: PageTitle.Home)
        let itemImage           = Image.home?.resizeImage(width: 25.0, height: 25.0)
        homeVC.tabBarItem       = UITabBarItem(title: PageTitle.Home.rawValue, image: itemImage, tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func creatShopNavigationController() -> UINavigationController {
        let shopVC              = TBMainVC(pageType: PageTitle.Shop)
        let itemImage               = Image.shop?.resizeImage(width: 25.0, height: 25.0)
        shopVC.tabBarItem       = UITabBarItem(title: PageTitle.Shop.rawValue, image: itemImage, tag: 1)
        return UINavigationController(rootViewController: shopVC)
    }
    
    func createAccountNavigationController() -> UINavigationController {
        let accountVC           = TBMainVC(pageType: PageTitle.Account)
        let itemImage           = Image.account?.resizeImage(width: 25.0, height: 25.0)
        accountVC.tabBarItem    = UITabBarItem(title: PageTitle.Account.rawValue, image: itemImage, tag: 2)
        return UINavigationController(rootViewController: accountVC)
    }
    
    func createBagNavigationController() -> UINavigationController {
        let bagVC               = TBMainVC(pageType: PageTitle.bag)
        let itemImage           = Image.bag?.resizeImage(width: 25.0, height: 25.0)
        bagVC.tabBarItem        = UITabBarItem(title: PageTitle.bag.rawValue, image: itemImage, tag: 3)
        return UINavigationController(rootViewController: bagVC)
    }
}
