//
//  Links.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
struct Links : Codable {
    let current : String?
    let html : String?
    let download : String?
    let photos: String?
    enum CodingKeys: String, CodingKey {

        case current = "self"
        case html = "html"
        case download = "download"
        case photos = "photos"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current = try values.decodeIfPresent(String.self, forKey: .current)
        html = try values.decodeIfPresent(String.self, forKey: .html)
        download = try values.decodeIfPresent(String.self, forKey: .download)
        photos = try values.decodeIfPresent(String.self, forKey: .photos)

    }

}
