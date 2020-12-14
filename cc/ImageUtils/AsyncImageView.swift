//
//  AsyncImageView.swift
//  cc
//
//  Created by dph on 2020/12/14.
//

import SwiftUI

struct AsyncImageView: View {
    @ObservedObject var loader: ImageLoader
    

    
    
    init(urlString: String, cache: MyImageCache) {
        loader = ImageLoader(urlString: urlString, cache: cache)
    }
    
    var body: some View {
        Image(uiImage: loader.image ?? ImageLoader.placeholder)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
