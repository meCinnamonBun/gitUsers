//
//  GitUser.swift
//  GitUser
//
//  Created by Andrey on 17.05.2021.
//

import UIKit

struct GitUser: Decodable {
    var name: String?
    var imageURL: String?
    var id: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageURL = "avatar_url"
        case id
    }
}
