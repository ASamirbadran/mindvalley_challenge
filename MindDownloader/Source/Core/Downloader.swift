//
//  Downloader.swift
//  MindRemoteLoader
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit
let defaultSession = URLSession(configuration: .default)

open class Downloader {
    static var shared: Downloader = Downloader()
    let imageCache = NSCache<NSString, NSData>()

    func fetchData(url : URL,
                   dataType: DataType,
                   completion: @escaping (
        _ result: Swift.Result<Data, Error>)
        -> Void) {
        if let cachedImageData = imageCache.object(forKey: url.absoluteString as NSString) as Data? {
            completion(.success(cachedImageData))
            return
        }

        defaultSession.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(.failure(error))

            } else {
                if let data = data {
                    let dataImageToCache = data
                    self.imageCache.setObject(dataImageToCache as NSData, forKey: url.absoluteString as NSString)
                    completion(.success(data))
                }
            }
        }.resume()
        
    }
    
    func cancelFetching(url: URL) {
        URLSession.shared.getAllTasks { sessions in
            guard let session = sessions.first(where: {$0.currentRequest?.url == url}) else { return }
            session.cancel()
        }
    }
    
    
}



////GETTING CASH
//if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
//      }
//
//// SETTING CASH
//let imageToCache = UIImage(data: data)
//self.imageCache.setObject(imageToCache!, forKey: url.absoluteString as NSString)
