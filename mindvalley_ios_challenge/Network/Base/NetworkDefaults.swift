//
//  NetworkDefaults.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
struct NetworkDefaults {
    var baseUrl: String
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults(baseUrl: "error")
        return instance
    }
}
