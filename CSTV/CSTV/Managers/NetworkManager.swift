//
//  NetworkManager.swift
//  CSTV
//
//  Created by Victor Vieira on 01/04/23.
//

import Foundation
import Combine
import UIKit

enum Endpoint: String {
    case matches = "matches/upcoming"
    case teams = "teams"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://api.pandascore.co/csgo/"
    
    
    func getData<T: Decodable>(endpoint: Endpoint, queryItems: [URLQueryItem] = [], id: Int? = nil, type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            guard let self = self, var url = URL(string: self.baseURL.appending(endpoint.rawValue).appending(id == nil ? "" : "/\(id ?? 0)")) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            url.append(queryItems: queryItems)
            var request = URLRequest(url: url)
             request.addValue("Bearer FKIEYAHcGipybNewRe2a3SdRjkO3gfLxGNHfAPAdZbEQYEFydMA", forHTTPHeaderField: "authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
}


enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
