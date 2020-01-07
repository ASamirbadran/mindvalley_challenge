//
//  MindDownloader.swift
//  MindRemoteLoader
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit
let defaultSession = URLSession(configuration: .default)

open class MindDownloader {
    public static var shared: MindDownloader = MindDownloader()
   
    func fetchData(url : URL,
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
    
    open func cancelFetching(url: URL) {
        URLSession.shared.getAllTasks { sessions in
            guard let session = sessions.first(where: {$0.currentRequest?.url == url}) else { return }
            session.cancel()
        }
    }
}
