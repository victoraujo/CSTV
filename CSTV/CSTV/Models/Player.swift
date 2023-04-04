//
//  Player.swift
//  CSTV
//
//  Created by Victor Vieira on 02/04/23.
//

import Foundation

struct Player: Decodable, Hashable {
    let firstName: String?
    let id: Int?
    let imageUrl: String?
    let lastName: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case imageUrl = "image_url"
        case lastName = "last_name"
        case name
    }
}
