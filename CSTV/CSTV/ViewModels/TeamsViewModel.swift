//
//  TeamsViewModel.swift
//  CSTV
//
//  Created by Victor Vieira on 02/04/23.
//

import Foundation
import Combine
import SwiftUI

class TeamsViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published var teams = [Team]()

    func getDetailsData(id: Int) {
    let queryItems = [URLQueryItem(name: "filter[id]", value: "\(id)")]
        print("mey query: \(queryItems)")
        NetworkManager.shared.getData(endpoint: .teams, queryItems: queryItems, type: Team.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] teamsData in
                self?.teams = teamsData
            }
            .store(in: &cancellables)
        }
}
