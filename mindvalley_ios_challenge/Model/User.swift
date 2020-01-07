//
//  User.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import Foundation
struct User : Codable {
    let id : String?
    let username : String?
    let name : String?
    let profileImage : ProfileImage?
    let links : Links?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case username = "username"
        case name = "name"
        case profileImage = "profile_image"
        case links = "links"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        profileImage = try values.decodeIfPresent(ProfileImage.self, forKey: .profileImage)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
    }
}
