//
//  Serie.swift
//  CSTV
//
//  Created by Victor Vieira on 01/04/23.
//

import Foundation

struct Serie: Decodable, Hashable {
    let beginAt: String?
    let endAt: String?
    let fullName: String?
    let id: Int?
    let leagueId: Int?
    let modifiedAt: String?
    let name: String?
    let season: String?
    let slug: String?
    let winnerId: Int?
    let winnerType: CompetitorType?
    let year: Int?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case fullName = "full_name"
        case id
        case leagueId = "league_id"
        case modifiedAt = "modified_at"
        case name
        case season
        case slug
        case winnerId = "winner_id"
        case winnerType = "winner_type"
        case year
    }
}
