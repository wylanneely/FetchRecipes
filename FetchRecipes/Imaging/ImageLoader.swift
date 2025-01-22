//
//  ImageLoader.swift
//  FetchRecipes
//
//  Created by Wylan L Neely on 1/17/25.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    func loadImage(from url: URL) {
        // Check if the image is cached
        if let cachedImage = ImageCache.shared.getImage(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }
        
        // If not cached, download the image
        cancellable = NetworkController.downloadImage(from: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] downloadedImage in
                // Cache the downloaded image
                ImageCache.shared.setImage(downloadedImage, forKey: url.absoluteString)
                self?.image = downloadedImage
            })
    }

    deinit {
        cancellable?.cancel()
    }
}
