//
//  Container.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit

class Container {
    class func setRootViewController(_ viewController: UIViewController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.window?.rootViewController = viewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    class func getHomeScreen() -> HomeViewController {
        guard let homeVC = HomeRouter.createModule() as? HomeViewController else {
            return HomeViewController()
        }
        return homeVC
    }
}
