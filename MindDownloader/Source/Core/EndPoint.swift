//
//  EndPoint.swift
//  MindDownloader
//
//  Created by Ahmed Samir on 1/6/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
public protocol EndPoint {
    var baseUrl: String { get }
    var httpMethod: RequestMethod { get }
    var path: String { get }
    var encoding: Encoding { get }
    var paramters:[String:Any]? { get}
}



public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

public protocol Encoding {
    func encode(_ requet: URLRequest ,with paramters:[String:Any])throws -> URLRequest
}

public struct JSONEncoding: Encoding {
    
    public static let `default` = JSONEncoding()
    
    public func encode(_ requet: URLRequest ,with paramters:[String:Any])throws -> URLRequest {
        var newRequest = requet
        let data = try JSONSerialization.data(withJSONObject: paramters, options: [])
        newRequest.httpBody = data
        return newRequest
    }
    
    
}
