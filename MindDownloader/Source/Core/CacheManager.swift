//
//  CacheManager.swift
//  MindDownloader
//
//  Created by Ahmed Samir on 1/7/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit

open class CacheManager {
    let dataCache = NSCache<NSString, NSData>()
    public static var shared: CacheManager = CacheManager()
    
    func setCacheLimit(totalCostLimit:Int, countLimit:Int) {
        dataCache.totalCostLimit = totalCostLimit
        dataCache.countLimit = countLimit
    }
    
    func setObject(data: NSData, forKey: NSString){
        dataCache.setObject(data, forKey: forKey)
    }
    
    func getObject(forKey: NSString) -> NSData?{
        return dataCache.object(forKey: forKey)
    }
    
    func removeObject(forKey: NSString){
        return dataCache.removeObject(forKey: forKey)
    }
}

