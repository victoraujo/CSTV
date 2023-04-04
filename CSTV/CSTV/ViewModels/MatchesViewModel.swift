//
//  MatchesViewModel.swift
//  CSTV
//
//  Created by Victor Vieira on 01/04/23.
//

import Foundation
import Combine
import SwiftUI

class MatchesViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published var matches = [Match]()
    
    func getHomeData() {
        let queryItems = [URLQueryItem(name: "page", value: "1"), URLQueryItem(name: "size", value: "10"), URLQueryItem(name: "per_page", value: "20")]
        NetworkManager.shared.getData(endpoint: .matches, queryItems: queryItems, type: Match.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] matchesData in
                self?.matches = matchesData
            }
            .store(in: &cancellables)
        }
}
