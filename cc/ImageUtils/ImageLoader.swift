//
//  ImageLoader.swift
//  cc
//
//  Created by dph on 2020/12/14.
//

import Foundation
import SwiftUI
import Combine


class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    static let placeholder = UIImage(systemName: "pencil")!
    
    
    var cache: MyImageCache
    var urlString: String
    var cancellable: AnyCancellable?
    
        
    init(urlString: String, cache: MyImageCache) {
        self.urlString = urlString
        self.cache = cache
        
        loadImage()
    }
    
    
    func loadImage() {
        if loadImageFromCache() {
            return
        }
        loadImageFromURL()
    }
    
    
    func loadImageFromCache() -> Bool {
        guard let cacheImage = cache[urlString] else {
            return false
        }
        print("loaded from cache")
        self.image = cacheImage
        return true
    }
    
    func loadImageFromURL(){
        print("loaded from URL")
        guard let url = URL(string: urlString) else {
            print("\(urlString) is not valid")
            return 
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data )}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: {
                self.cache[self.urlString] = $0
            })
            .assign(to: \.image, on: self)
    }
    
}
