//
//  Game.swift
//  CSTV
//
//  Created by Victor Vieira on 31/03/23.
//

import Foundation

struct Game: Decodable, Hashable {
    let beginAt: String?
    let complete: Bool?
    let detailedStats: Bool?
    let endAt: String?
    let finished: Bool?
    let forfeit: Bool?
    let id: Int?
    let lenght: Int?
    let matchId:  Int?
    let position: Int?
    let status: Status?
    let winner: Winner?
    let winnerType: CompetitorType?

    enum CodingKeys: String, CodingKey{
        case beginAt = "begin_at"
        case complete
        case detailedStats = "detailed_stats"
        case endAt = "end_at"
        case finished
        case forfeit
        case id
        case lenght
        case matchId = "match_id"
        case position
        case status
        case winner
        case winnerType = "winner_type"
    }
}

struct Winner: Decodable, Hashable {
    let id: Int?
    let type: CompetitorType?
}

enum CompetitorType: String, Decodable, CaseIterable, Hashable {
    case teams
    case player
    case unkown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try? container.decode(String.self)
        self = CompetitorType(rawValue: stringValue ?? "") ?? .unkown
    }
}

enum Status: String, Decodable, CaseIterable, Hashable {
    case finished
    case notPlayed
    case notStarted
    case running
    case unkown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try? container.decode(String.self)
        if stringValue == "finished" {
            self = .finished
        } else if stringValue == "not_played" {
            self = .notPlayed
        } else if stringValue == "not_started" {
            self = .notStarted
        } else if stringValue == "running" {
            self = .running
        } else {
            self = .unkown
        }
    }
}
