//
//  CustomError.swift
//  MindDownloader
//
//  Created by Ahmed Samir on 1/6/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
enum CustomError: Error, LocalizedError {
    case underlying(error: Error)
    case failure
    var errorDescription: String? {
        switch self {
        case .failure:
            return "Failed To Parse Error"
        case . underlying(let error):
            return error.localizedDescription
        }
    }
}
