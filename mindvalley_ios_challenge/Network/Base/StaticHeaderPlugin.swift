//
//  StaticHeaderPlugin.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
import Moya

public struct StaticHeaderPlugin: PluginType {

    var headers: [String: String] = [:]
    public init(headers: [String: String]) {
        self.headers = headers
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request

        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}