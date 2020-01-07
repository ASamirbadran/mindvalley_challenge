//
//  BoardService.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
import MindDownloader


enum BoardService {
    case readBoardData
}

extension BoardService: EndPoint {
    var baseUrl: String {
        return "\(Environment.rootURL)/raw/wgkJgazE)"
        
    }
    
    var httpMethod: RequestMethod {
        switch self {
        case .readBoardData:
            return .get
        }
    }
    
    var encoding: Encoding {
        switch self {
        case .readBoardData :
            return JSONEncoding.default
        }
    }
    
    var paramters: [String : Any]? {
        return nil
    }
    
    
    
    var path: String {
        switch self {
        case .readBoardData:
            return "raw/wgkJgazE"
        }
    }
    
}
