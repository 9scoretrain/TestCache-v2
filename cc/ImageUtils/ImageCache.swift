//
//  ImageCache.swift
//  cc
//
//  Created by dph on 2020/12/14.
//

import Foundation
import SwiftUI



protocol ImageCache {
    subscript(_ urlString: String) -> UIImage? { get set }
}

struct MyImageCache: ImageCache {
    subscript(urlString: String) -> UIImage? {
        get {
            cache.object(forKey: urlString as NSString)
        }
        set {
            newValue == nil ? cache.removeObject(forKey: urlString as NSString) : cache.setObject(newValue!, forKey: urlString as NSString)
        }
    }
    
    var cache = NSCache<NSString, UIImage>()
}




struct MyImageCacheKey: EnvironmentKey {
    static var defaultValue: MyImageCache = MyImageCache()
}

extension EnvironmentValues {
    var myImageCacheKey: MyImageCache {
        get { self[MyImageCacheKey.self] }
        set { self[MyImageCacheKey.self] = newValue }
    }
}
