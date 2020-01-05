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
    
    func initNetwork() {
        //getting from enviroment xconfig
        let defaults = NetworkDefaults(baseUrl: Environment.rootURL)
        NetworkManager.shared = NetworkManager(config: defaults)
    }
    
    
    func openHomeScreen() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = Container.getHomeScreen()
        self.window?.makeKeyAndVisible()
    }

}
