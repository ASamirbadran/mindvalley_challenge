//
//  NetworkError.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
import Moya

enum `Type`:String, Codable {
    case business
    case system
    case mapping
    case formValidation
}
struct NetworkError: Codable, Error {

    //enum (busineess , system , mapping) will know from moya error by (type / status code)
    var code: Int?
    var message: String?
    var type: Type?
    var innerErrors: [String: [String]]?
    //    var userInfo: [String: Any] = [:]

    init () {

    }

    enum CodingKeys: String, CodingKey {

          case message = "message"
          case innerErrors = "errors"
      }
    
    init(message:String, innerErrors: [String: [String]]) {
        self.message = message
        self.innerErrors = innerErrors
        self.type = .business
        self.code = -1
    }
    
    init(error: MoyaError) {
        self.code = error.errorCode
        self.message = error.errorDescription

        switch error {
        case .underlying(let error, _):
            self.type = .system
            print(error)
        //            userInfo["error"] = error
        default :
            self.type = .mapping
        }
    }
}

extension NetworkError {
    static let parseError: NetworkError = {
        var error = NetworkError()
        error.type = Type.mapping
        return error
    }()
}
