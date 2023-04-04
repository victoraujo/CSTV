//
//  Match.swift
//  CSTV
//
//  Created by Victor Vieira on 01/04/23.
//

import Foundation

struct Match: Decodable, Hashable {
    let beginAt: String?
    let detailedStats: Bool?
    let games: [Game]?
    let league: League?
    let opponents: [Opponent]?
    let serie: Serie?
    let status: Status?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case detailedStats = "detailed_stats"
        case games
        case league
        case opponents
        case serie
        case status
    }
}
