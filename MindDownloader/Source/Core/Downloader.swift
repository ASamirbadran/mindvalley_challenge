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
        _ result: Swift.Result<Data, CustomError>)
        -> Void) {
        
        defaultSession.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(CustomError.underlying(error: error)))
                    
                } else {
                    completion(.failure(CustomError.failure))
                }
                return
            }
            completion(.success(data))
        }.resume()
        
    }
    
    func cancelFetching(url: URL) {
        URLSession.shared.getAllTasks { sessions in
            guard let session = sessions.first(where: {$0.currentRequest?.url == url}) else { return }
            session.cancel()
        }
    }
    
    func fetchImage(url : URL,
                    completion: @escaping (
        _ result: Swift.Result<Data, CustomError>)
        -> Void) {
        if let cachedImageData = imageCache.object(forKey: url.absoluteString as NSString) as Data? {
            completion(.success(cachedImageData))
            return
        }
        self.fetchData(url: url, dataType: .image) { result in
            switch result {
            case .success(let data):
                let dataImageToCache = data
                self.imageCache.setObject(dataImageToCache as NSData, forKey: url.absoluteString as NSString)
                completion(.success(data))
            case.failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}
