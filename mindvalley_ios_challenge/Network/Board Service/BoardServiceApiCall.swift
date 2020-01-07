//
//  BoardServiceApiCall.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import MindDownloader
class BoardServiceApiCall {
    
    func getBoardData(completion: @escaping (
        _ result: Swift.Result<[Board], Error>
        ) -> Void) {
        
        MindDownloader.shared.fetchData(endpoint: BoardService.readBoardData){ result in
            switch result{
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode([Board].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(CustomError.urlParse))
                    print(error)
                }
            case .failure( _):
                completion(.failure(CustomError.urlParse))
            }
        }
        
    }
}
