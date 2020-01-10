//
//  MindDownloader.swift
//  MindRemoteLoader
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit

open class MindDownloader {
    public static var shared: MindDownloader = MindDownloader()
    
    // for fetching data for image .
    public func fetchData(url : URL,
                          completion: @escaping (
        _ result: Swift.Result<Data, CustomError>)
        -> Void) {
        let defaultSession = getSession()
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
    
    //for fetching Json
    public func fetchData(endpoint : EndPoint,
                          completion: @escaping (
        _ result: Swift.Result<Data, CustomError>)
        -> Void) -> URLSessionTask?{
        
        if let cachedJsonData = CacheManager.shared.getObject(forKey: endpoint.baseUrl as NSString) as Data? {
            completion(.success(cachedJsonData))
            return nil
        }
        
        do {
            let request = try self.buildRequest(endpoint: endpoint)
            let defaultSession = getSession()
            let task = defaultSession.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    if let error = error {
                        completion(.failure(CustomError.underlying(error: error)))
                        
                    } else {
                        completion(.failure(CustomError.failure))
                    }
                    return
                }
                //caching Json
                CacheManager.shared.setObject(data: data as NSData, forKey: endpoint.baseUrl as NSString)
                completion(.success(data))
                
            }
            task.resume()
            
            return task
            
        }catch let error as CustomError {
            completion(.failure(error))
        } catch {
            completion(.failure(.underlying(error: error)))
        }
        return nil
    }
    
    
    //building url from endpoing request for loading json
    internal func buildRequest(endpoint:EndPoint) throws -> URLRequest {
        
        let stringPath = endpoint.baseUrl
        
        guard var urlPath = URL(string: stringPath) else {
            throw CustomError.urlParse
        }
        if !endpoint.path.isEmpty {
            urlPath = urlPath.appendingPathComponent(endpoint.path)
        }
        
        var request = URLRequest(url: urlPath)
        request.httpMethod = "GET"// endpoint.httpMethod.hashValue
        
        if let paramters = endpoint.paramters {
            // TODO: should encode paramters as the encode type and attach to request
            //currently support Json Encoding only
            request =  try endpoint.encoding.encode(request, with: paramters)
        }
        
        return request
    }
    
    open func cancelFetching(url: URL) {
        URLSession.shared.getAllTasks { sessions in
            guard let session = sessions.first(where: {$0.currentRequest?.url == url}) else { return }
            session.cancel()
        }
    }
    
    open func setCacheLimit(totalCostLimit:Int, countLimit:Int) {
        CacheManager.shared.setCacheLimit(totalCostLimit: totalCostLimit, countLimit: countLimit)
    }
    
    func getSession() -> URLSession {
        let config = URLSessionConfiguration.default
        //assuming same response regarding same Url
        config.requestCachePolicy = .returnCacheDataElseLoad
        let session = URLSession(configuration: config)
        return session
    }
}
