//
//  AppDelegate+Extension.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    func openHomeScreen() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = Container.getHomeScreen()
        self.window?.makeKeyAndVisible()
    }

}
