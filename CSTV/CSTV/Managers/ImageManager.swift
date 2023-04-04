//
//  ImageManager.swift
//  CSTV
//
//  Created by Victor Vieira on 03/04/23.
//

import SwiftUI
import Combine

class ImageManager: ObservableObject {
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    func loadImage(fromURL url: String) {
        guard let imageURL = URL(string: url) else {
            image = UIColor(Color.defaultColor).image()
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] image in
                self?.image = image ?? UIColor(Color.defaultColor).image()
            })
    }
}
