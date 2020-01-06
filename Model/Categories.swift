//
//  Categories.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
struct Categories : Codable {
    let id : Int?
    let title : String?
    let photoCount : Int?
    let links : Links?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case photoCount = "photo_count"
        case links = "links"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        photoCount = try values.decodeIfPresent(Int.self, forKey: .photoCount)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
    }

}
