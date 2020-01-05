//
//  NetworkManager+BoardService.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Moya

extension NetworkManager {

    func getBoardData(completion: @escaping (
        _ result: Swift.Result<[Board], NetworkError>
        ) -> Void) {

        provider.request(MultiTarget(BoardService.readBoardData)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode([Board].self, from: response.data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(NetworkError.parseError))
                        print(error)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError))
                    } catch {
                        completion(.failure(NetworkError.parseError))
                    }
                }

            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError))
            }
        }

    }
}
