//
//  Team.swift
//  CSTV
//
//  Created by Victor Vieira on 02/04/23.
//

import Foundation

struct Team: Decodable, Hashable {
    let acronym: String?
    let id: Int?
    let imageUrl: String?
    let name: String?
    let players: [Player]
}
