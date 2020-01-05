//
//  Board.swift
//  mindvalley_ios_challenge
//
//  Created by Ahmed Samir on 1/2/20.
//  Copyright © 2020 Tania. All rights reserved.
//

struct Board : Codable {
    let id : String?
    let createdAt : String?
    let width : Int?
    let height : Int?
    let color : String?
    let likes : Int?
    let likedByUser : Bool?
    let user : User?
    let currentUserCollections : [String]?
    let urls : Urls?
    let categories : [Categories]?
    let links : Links?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case createdAt = "created_at"
        case width = "width"
        case height = "height"
        case color = "color"
        case likes = "likes"
        case likedByUser = "liked_by_user"
        case user = "user"
        case currentUserCollections = "current_user_collections"
        case urls = "urls"
        case categories = "categories"
        case links = "links"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        likes = try values.decodeIfPresent(Int.self, forKey: .likes)
        likedByUser = try values.decodeIfPresent(Bool.self, forKey: .likedByUser)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        currentUserCollections = try values.decodeIfPresent([String].self, forKey: .currentUserCollections)
        urls = try values.decodeIfPresent(Urls.self, forKey: .urls)
        categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
    }
}
