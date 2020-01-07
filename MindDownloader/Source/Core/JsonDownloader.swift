//
//  JsonDownloader.swift
//  MindDownloader
//
//  Created by Ahmed Samir on 1/7/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit
open class JsonDownloader {
    public static var shared: JsonDownloader = JsonDownloader()
    
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
    
    public func request(endpoint : EndPoint,
                        completion: @escaping (
        _ result: Swift.Result<Data, CustomError>)
        -> Void) -> URLSessionTask?{
        do {
            let request = try self.buildRequest(endpoint: endpoint)
            
            let task = defaultSession.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    if let error = error {
                        completion(.failure(CustomError.underlying(error: error)))
                        
                    } else {
                        completion(.failure(CustomError.failure))
                    }
                    return
                }
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
}

