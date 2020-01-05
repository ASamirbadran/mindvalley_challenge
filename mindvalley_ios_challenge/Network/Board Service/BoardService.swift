//
//  BoardService.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
import Moya


enum BoardService {
    case readBoardData
}

extension BoardService: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig?.baseUrl ?? "")!
    }

    var path: String {
        switch self {
        case .readBoardData:
            return "raw/wgkJgazE"
        }
    }

    var method: Moya.Method {
        switch self {
        case .readBoardData:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .readBoardData:
            return Data()
        }
    }

    var task: Task {
        switch self {
        case .readBoardData :
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var authorizationType: AuthorizationType {
        return .none
    }
}
