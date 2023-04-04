//
//  League.swift
//  CSTV
//
//  Created by Victor Vieira on 31/03/23.
//

import Foundation

struct League: Decodable, Hashable {
    let id: Int?
    let imageUrl: String?
    let modifiedAt: String?
    let name: String?
    let slug: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image_url"
        case modifiedAt = "modified_at"
        case name
        case slug
        case url
    }
}
