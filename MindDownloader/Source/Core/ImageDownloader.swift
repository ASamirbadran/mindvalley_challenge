//
//  ImageDownloader.swift
//  MindDownloader
//
//  Created by Ahmed Samir on 1/6/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
open class ImageDownloader {
    
    static var shared: ImageDownloader = ImageDownloader()
    func fetchImage(url : URL,
                    completion: @escaping (
        _ result: Swift.Result<Data, CustomError>)
        -> Void) {
        
        if let cachedImageData = CacheManager.shared.getObject(forKey: url.absoluteString as NSString) as Data? {
            completion(.success(cachedImageData))
            return
        }
        MindDownloader.shared.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                let dataImageToCache = data
                
                CacheManager.shared.setObject(data: dataImageToCache as NSData, forKey: url.absoluteString as NSString)
                completion(.success(data))
            case.failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}
