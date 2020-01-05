//
//  Downloader.swift
//  MindRemoteLoader
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
let defaultSession = URLSession(configuration: .default)

open class Downloader {
    static var shared: Downloader = Downloader()
    func fetchData(url : URL,                   dataType: DataType,
                   completion: @escaping (
        _ result: Swift.Result<Data, Error>,
        _ urlResponse: URLResponse?)
        -> Void) {
        defaultSession.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(.failure(error), nil)

            } else {
                if let data = data {
                    completion(.success(data), response)
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
