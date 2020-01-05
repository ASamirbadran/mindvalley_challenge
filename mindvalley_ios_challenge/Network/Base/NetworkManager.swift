//
//  NetworkManager.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
import Moya

class NetworkManager {

    static var shared: NetworkManager!

    var networkConfig: NetworkDefaults?

    let provider: MoyaProvider<MultiTarget>

    init(isStubing: Bool) {
        if isStubing == true {
            provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub)
        } else {
            fatalError("init testing network in production")
        }
    }
    
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config

        let headerPlugin = StaticHeaderPlugin(
            headers: [
                "Content-Type": "application/json",
                "Accept": "application/json",
        ])

        provider = MoyaProvider<MultiTarget>(//manager: ,
            plugins: [headerPlugin,
                      NetworkLoggerPlugin(verbose: true)])
    }

}

extension MultiTarget: AccessTokenAuthorizable {
    public var authorizationType: AuthorizationType {
        // here you will have to check whether the `target` is also conforming to `AccessTokenAuthorizable` or not...
        if target is AccessTokenAuthorizable {
            guard let authTarget = target as? AccessTokenAuthorizable else {
                return .none
            }
            return authTarget.authorizationType
        }
        return .none
    }
}
