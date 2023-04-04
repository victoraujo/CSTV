//
//  Opponents.swift
//  CSTV
//
//  Created by Victor Vieira on 01/04/23.
//

import Foundation

struct Opponent: Decodable, Hashable {
    let opponent: OpponentData?
    let type: CompetitorType?
}

struct OpponentData: Decodable, Hashable {
    let acronym: String?
    let id: Int?
    let imageUrl: String?
    let location: String?
    let modifiedAt: String?
    let name: String?
    let slug: String?

    enum CodingKeys: String, CodingKey {
        case acronym
        case id
        case imageUrl = "image_url"
        case location
        case modifiedAt = "modified_at"
        case name
        case slug
    }
}
