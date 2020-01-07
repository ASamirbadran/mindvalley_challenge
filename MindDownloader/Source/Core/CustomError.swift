//
//  CustomError.swift
//  MindDownloader
//
//  Created by Ahmed Samir on 1/6/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
public enum CustomError: Error, LocalizedError {
    case underlying(error: Error)
    case failure
    case urlParse
    public var errorDescription: String? {
        switch self {
        case .failure:
            return "Failed To Parse Error"
        case . underlying(let error):
            return error.localizedDescription
        case .urlParse:
            return "Failed to parse string to url"
        }
    }
}
